class Sponsor < ActiveRecord::Base
  has_many :scholarships
  has_many :donations

  def full_name
    "#{first_name} #{last_name}"
  end
end
