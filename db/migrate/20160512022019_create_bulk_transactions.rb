class CreateBulkTransactions < ActiveRecord::Migration
  def change
    drop_table :bulk_transactions
    create_table :bulk_transactions do |t|
      t.date :settled_date
      t.string :sender
      t.decimal :amount
      t.decimal :amount_lkr
      t.decimal :rate
      t.date :bank_date
      t.string :chq_no
      t.string :bank_acc
      t.string :beneficiary
      t.text :notes
      t.integer :effective_year
      t.integer :effective_months

      t.timestamps null: false
    end
  end
end
