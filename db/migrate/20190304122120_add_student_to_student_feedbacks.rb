class AddStudentToStudentFeedbacks < ActiveRecord::Migration
  def change
    add_reference :student_feedbacks, :student, index: true, foreign_key: true
  end
end
