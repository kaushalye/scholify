class RemoveMonthFromPayment < ActiveRecord::Migration
  def change
    remove_column :payments, :month, :integer
  end
end
