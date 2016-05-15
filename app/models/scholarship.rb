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
    student.full_name
  end

  def self.eligible_all
    where("status = :status AND end_date > :rightnow AND start_date < :rightnow", {status: "ACTIVE", rightnow: Time.now})
  end

end
