class BulkTransaction < ActiveRecord::Base
  has_many :payments

end
