class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :student, index: true
      t.belongs_to :scholarship, index: true
      t.decimal :amount
      t.string :from_account
      t.string :to_account
      t.string :external_ref
      t.text :notes
      t.timestamps null: false
    end
  end
end
