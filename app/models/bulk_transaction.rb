class BulkTransaction < ActiveRecord::Base

  def eligible_payments
    payments = []
    schols = Scholarship.eligible_all
    schols.each do |schol|
      pay_start = schol.start_date.month
      last_payment = Payment.last_payment(schol.id)
      #This schol has a payment entry, update the pay start
      if (last_payment)
        pay_start = last_payment.month+1
      end
      #insert the eliegible payment
      (pay_start .. Date.today.month).each do |i|
        month = i
        year = Date.today.year
        if (i > Scholarship::NUM_OF_SCHOLS_PER_YEAR)
          month = i % Scholarship::NUM_OF_SCHOLS_PER_YEAR
          year  = year + 1
        end
        payment = {
          'schol_id' => schol.id,
          'schol_start' => schol.start_date,
          'status' => schol.status,
          'student_full_name' => schol.student.full_name,
          'amount' => schol.amount,
          'month' => month,
          'year' => year
        }
        payments.push payment
      end
    end
    payments
  end
end
