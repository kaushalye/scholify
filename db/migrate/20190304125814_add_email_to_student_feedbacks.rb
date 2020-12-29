class AddEmailToStudentFeedbacks < ActiveRecord::Migration
  def change
    add_column :student_feedbacks, :email, :string
  end
end
