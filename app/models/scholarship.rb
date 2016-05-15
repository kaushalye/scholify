class Scholarship < ActiveRecord::Base
  belongs_to :student
  belongs_to :sponsor
  has_many :donations
  has_many :payments

  validates :student, presence: true
  validates :sponsor, presence: true

  STATUSES = ['ACTIVE', 'INACTIVE', 'NOT STARTED']
  NUM_OF_SCHOLS_PER_YEAR = 10

  def to_str
    student.full_name
  end

end
