class CreateBadDebts < ActiveRecord::Migration
  def change
    create_table :bad_debts do |t|
      t.date :eff_date
      t.decimal :amount
      t.string :notes

      t.timestamps null: false
    end
  end
end
