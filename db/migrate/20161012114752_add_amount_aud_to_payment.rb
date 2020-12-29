class AddAmountAudToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :amount_lkr, :decimal
    add_column :payments, :effective_year, :integer
    add_column :payments, :effective_month, :integer
  end
end
