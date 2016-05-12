class BulkTransaction < ActiveRecord::Base
  def target_schols
    Scholarship.where(status: 'ACTIVE')
  end
end
