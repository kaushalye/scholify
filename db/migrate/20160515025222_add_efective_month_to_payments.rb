class AddEfectiveMonthToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :month, :integer
  end
end
