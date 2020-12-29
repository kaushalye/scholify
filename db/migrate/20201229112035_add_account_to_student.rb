class AddAccountToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :account_name, :string
    add_column :students, :bank, :string
    add_column :students, :branch, :string
    add_column :students, :branch_no, :string
    add_column :students, :account_no, :string
  end
end
