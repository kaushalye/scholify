class AlterAmountLkrTablePayment < ActiveRecord::Migration
  def change
    rename_column :payments, :amount_lkr, :amount_aud
  end
end
