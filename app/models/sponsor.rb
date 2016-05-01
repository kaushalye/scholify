class Sponsor < ActiveRecord::Base
  has_many :scholarships
  has_many :donations
  TITLES =  ['Mr', 'Mrs', 'Ms', 'Dr']
  def full_name
    "#{first_name} #{last_name}"
  end
end
