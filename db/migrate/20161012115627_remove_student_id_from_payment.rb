class RemoveStudentIdFromPayment < ActiveRecord::Migration
  def change
    remove_column :payments, :student_id, :reference
  end
end
