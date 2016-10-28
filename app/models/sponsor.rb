class Sponsor < ActiveRecord::Base
  has_many :scholarships
  has_many :donations
  TITLES =  ['Mr.', 'Mrs.', 'Ms.', 'Dr.']

    
  def full_name
    "#{first_name} #{last_name}"
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
