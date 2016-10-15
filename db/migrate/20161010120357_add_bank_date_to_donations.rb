class AddBankDateToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :bank_date, :date
  end
end
