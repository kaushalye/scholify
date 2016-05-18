class RemoveUnwantedColumnsFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :from_account, :string
    remove_column :payments, :bulk_transactions_id, :string
    remove_column :payments, :external_ref, :string
    remove_column :payments, :year, :integer
  end
end
