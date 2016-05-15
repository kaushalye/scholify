class BulkTransaction < ActiveRecord::Base
  def eligible_payments
    payments = []
    schols = Scholarship.where("status = :status AND end_date > :rightnow AND start_date < :rightnow", {status: "ACTIVE", rightnow: Time.now})
    schols.each do |schol|
      last_payment = Payment.where(:scholarship_id => schol.id).order(:month).last
      pay_start = 1
      if(last_payment)
        pay_start =last_payment.month+1
      end
      #insert the eliegible payment
      (pay_start .. Date.today.month).each do |i|
        payment = {
          'schol_id' => schol.id,
          'status' => schol.status,
          'student_full_name' => schol.student.full_name,
          'amount' => schol.amount,
          'month' => i,
          'year' => Date.today.year
        }
        payments.push payment
      end
    end
    payments
  end
end
