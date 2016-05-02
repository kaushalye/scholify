class Donation < ActiveRecord::Base
  belongs_to :scholarship
  belongs_to :sponsor

  validates :scholarship, presence: true
  validates :sponsor, presence: true
end
