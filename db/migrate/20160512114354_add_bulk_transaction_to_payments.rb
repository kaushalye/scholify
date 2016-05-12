class AddBulkTransactionToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :bulk_transactions, index:true
  end
end
