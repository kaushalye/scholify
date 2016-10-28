class AddBankDateToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :bank_date, :date
  end
end
