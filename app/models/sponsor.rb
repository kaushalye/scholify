class Sponsor < ActiveRecord::Base
  has_many :scholarships
  has_many :donations
  has_many :bad_debts
  
  TITLES =  ['Mr.', 'Mrs.', 'Ms.', 'Dr.']

    
  def full_name
    "#{first_name} #{last_name}"
  end

  def scholarship_start_year
    firstScholStart = nil
    self.scholarships.each do |schol|
      if (firstScholStart==nil or firstScholStart>schol.start_date.year)
        firstScholStart=schol.start_date.year
      end
    end
    firstScholStart
  end
  
  def total_donations
    total = 0
    self.donations.each do |donation|
      total += donation.amount
    end
    total
  end

  def total_scholarship_amount
    total = 0
    self.scholarships.each do |schol|
      total += schol.amount * ((Date.today.year * 12 + Date.today.month) - (schol.start_date.year * 12 + schol.start_date.month))
    end
    total
  end

  
  def total_payments_aud
    total = 0
    self.scholarships.each do |schol|
      schol.payments.each do |p|
        total += p.amount_aud
      end
    end
    total
   end
  
  def total_payments_lkr
    total = 0
    self.scholarships.each do |schol|
      schol.payments.each do |p|
          total += p.amount
        end
    end
        total
    end
    
    
  def total_payments_aud_before_FYE(fye)
    total = 0
    self.scholarships.each do |schol|
      schol.payments.each do |p|
        if (p.effective_year<fye or (p.effective_year==fye and ['1.0','2.0','3.0','4.0','5.0','6.0'].include?p.effective_month))
          total += p.amount_aud
        end
      end
    end
    total
   end
   
  def total_payments_aud_within_FYE(fye)
    total = 0
    self.scholarships.each do |schol|
      schol.payments.each do |p|
        if ((p.effective_year==  (fye+1) and ['1.0','2.0','3.0','4.0','5.0','6.0'].include?p.effective_month) or (p.effective_year==fye and ['7.0','8.0','9.0','10.0','11.0','12.0'].include?p.effective_month))
          total += p.amount_aud
        end
      end
    end
    total
   end

  def total_bad_debts_at(eff_date)
    total = 0
    self.bad_debts.each do |debt|
      if (debt.eff_date<= eff_date)
        total += debt.amount
      end
      
    end
    total
  end

     
   def total_donations_before_FYE(fye)
     total = 0
     self.donations.each do |donation|
       if (donation.bank_date< Date.new(fye,7,1))
         total += donation.amount
       end
       
     end
     total
   end

  def total_donations_within_FYE(fye)
    total = 0
    self.donations.each do |donation|
      if (donation.bank_date>= Date.new(fye,7,1) and donation.bank_date< Date.new(fye+1,7,1))
        total += donation.amount
      end
      
    end
    total
  end
       
  # def outstanding
  #   to_pay = 0
  #   current_aud_lkr = 100
  #
  #   self.scholarships.each do |schol|
  #     to_pay += schol.amount * ((Date.today.year * 12 + Date.today.month) - (schol.start_date.year * 12 + schol.start_date.month))
  #   end
  #
  #   self.donations.each do |donation|
  #     to_pay -= donation.amount * current_aud_lkr
  #   end
  #
  #   to_pay
  # end
end
