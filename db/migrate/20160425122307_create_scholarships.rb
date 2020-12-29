class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.decimal :amount
      t.date :start_date
      t.date :end_date
      t.string :status
      t.belongs_to :sponsor, index: true
      t.belongs_to :student, index: true
      t.timestamps null: false
    end
  end
end
