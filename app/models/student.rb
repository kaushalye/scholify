class Student < ActiveRecord::Base
  has_many :scholarships
  has_many :payments

  def full_name
    "#{first_name} #{last_name}"
  end

end
