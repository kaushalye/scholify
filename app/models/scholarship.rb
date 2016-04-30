class Scholarship < ActiveRecord::Base
  belongs_to :student
  belongs_to :sponsor
  has_many :donations
  has_many :payments
end
