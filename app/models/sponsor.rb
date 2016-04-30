class Sponsor < ActiveRecord::Base
  has_many :scholarships
  has_many :donations
end
