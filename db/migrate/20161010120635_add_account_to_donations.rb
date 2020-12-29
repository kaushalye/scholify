class AddAccountToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :account, :string
  end
end
