class Donation < ActiveRecord::Base
  belongs_to :scholarship
  belongs_to :sponsor
end
