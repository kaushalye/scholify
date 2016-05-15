class Payment < ActiveRecord::Base
  belongs_to :scholarship
  belongs_to :student

  def self.for_scholarship schol_id
    where(:scholarship_id => schol_id)
  end

  def self.last_payment schol_id
    #this could be buggy. improve
    for_scholarship(schol_id).order(:month).last
  end
end
