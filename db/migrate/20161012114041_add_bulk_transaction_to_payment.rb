class AddBulkTransactionToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :bulk_transaction, index: true, foreign_key: true
  end
end
