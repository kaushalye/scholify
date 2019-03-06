class CreateStudentFeedbacks < ActiveRecord::Migration
  def change
    create_table :student_feedbacks do |t|
      t.datetime :timestamp
      t.integer :renew_year
      t.text :academic_progress
      t.text :comments

      t.timestamps null: false
    end
  end
end
