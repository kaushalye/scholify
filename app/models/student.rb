class Student < ActiveRecord::Base
  has_many :scholarships
  has_many :payments
end
