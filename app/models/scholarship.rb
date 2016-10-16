class Scholarship < ActiveRecord::Base
  belongs_to :student
  belongs_to :sponsor
  has_many :donations
  has_many :payments

  validates :student, presence: true
  validates :sponsor, presence: true

  STATUSES = ['ACTIVE', 'INACTIVE']
  NUM_OF_SCHOLS_PER_YEAR = 10

 
  
  def to_str
    sponsor.full_name + "#" + student.full_name
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
