class Student < ActiveRecord::Base
  has_many :scholarships
  has_many :payments

  DEPARTMENTS = ['CSE', 'ENTC', 'MEC']
  FACULTIES = ['ENG', 'TCP']

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def external_name
    "#{first_name} #{last_name[0,1]}."
  end

end
