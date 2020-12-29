class Scholarship < ActiveRecord::Base
  belongs_to :student
  belongs_to :sponsor
  has_many :donations
  has_many :payments

  validates :student, presence: true
  validates :sponsor, presence: true

  STATUSES = ['ACTIVE', 'COMPLETED']
  NUM_OF_SCHOLS_PER_YEAR = 10

 
  
  def to_str
    sponsor.full_name + "#" + student.full_name
  end

  def  get_status date
     if (end_date >= date)
       return 'ACTIVE'
     else
       return 'COMPLETED'
     end
  end
  
  def get_donation_due_from
    if (get_status( Date.today) == 'COMPLETED')
      return nil
    elsif (donations.size >0)
      lastDonation = donations.sort().last
      return lastDonation.valid_from + lastDonation.num_of_months.months
    end
  end
  
  
  def get_next_donation_due_date
      if (donations.size >0)
        lastDonation = donations.sort_by{|x| x.bank_date}.last
        return lastDonation.valid_from + lastDonation.num_of_months.months
      else
        return self.start_date
      end
 end
    
  def self.active_at check_date
      #where("status = :status AND end_date >= :when AND start_date < :when", {status: "ACTIVE", when: Date.today})
      where("end_date >= :date", {date: check_date.strftime("%Y%m%d")})
  end
  
  def self.eligible_all
    #where("status = :status AND end_date >= :when AND start_date < :when", {status: "ACTIVE", when: Date.today})
    where("end_date >= :date", {date: Date.today.strftime("%Y%m%d")})
  end

  def format_payment payment
    Payment.format_year_month payment.month
  end

  def past_payments
    Payment.for_scholarship self.id
  end

  def last_payment
    Payment.last_payment self.id
  end
end
