class Payment < ActiveRecord::Base
  belongs_to :scholarship
  belongs_to :student

end
