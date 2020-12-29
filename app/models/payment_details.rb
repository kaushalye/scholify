class Payment_Details
  @bt
  @schol
  @send_payment
 
 def initialize(scholarship, bulk_transaction)
  @bt=bulk_transaction
  @schol = scholarship
  @send_payment=true
 end
 
 def scholarship
   return @schol
 end
 
 def amount_lkr
   return @schol.amount
 end
 
 def schol_id
   return @schol.id
 end
 
 def notes
   return @bt.notes
 end
 
 def bank_date
   return @bt.bank_date
 end

 def effective_year
   return @bt.effective_year
 end 
 
 def effective_month
   return @bt.effective_months
 end

 def rate
   return @bt.rate
 end
 
 def send_payment
   return @send_payment
 end
end