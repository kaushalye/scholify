class Payment < ActiveRecord::Base
  belongs_to :scholarship
  belongs_to :student

  def self.for_scholarship schol_id
    where(:scholarship_id => schol_id)
  end

  def self.last_payment schol_id
    for_scholarship(schol_id).order(:id).last
  end

  def self.format_year_month month
    "#{month / 10}-#{month % 10 + 1}"
  end

  def self.eligible_payments
    payments = []
    schols = Scholarship.eligible_all
    schols.each do |schol|
      payment_index = "#{schol.start_date.year}#{schol.start_date.month}".to_i - 1
      last_payment = Payment.last_payment(schol.id)
      #This schol has a payment entry, start from next month
      #Otherwise use the start month of the scholarship
      if ( last_payment )
        payment_index = last_payment.effective_month.to_i + 1
      end

      payments_up_to = Date.today + 1.month
      payment_index_up_to = "#{payments_up_to.year}#{payments_up_to.month}".to_i - 1
      #insert the eliegible payment
      (payment_index .. payment_index_up_to ).each do |i|
        payment = Payment.new
        payment.scholarship = schol
        payment.effective_month = i
        payments.push payment
      end
    end

    payments
  end


end
