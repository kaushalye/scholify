class Payment < ActiveRecord::Base
  belongs_to :scholarship
  belongs_to :student

  def self.last_payment schol_id
    where(:scholarship_id => schol_id).order(:month).last
  end
end
