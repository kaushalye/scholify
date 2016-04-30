class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :sponsor, index: true
      t.belongs_to :scholarship, index: true
      t.decimal :amount
      t.date :valid_from
      t.integer :num_of_months
      t.timestamps null: false
    end
  end
end
