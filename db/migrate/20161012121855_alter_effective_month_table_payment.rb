class AlterEffectiveMonthTablePayment < ActiveRecord::Migration
  def change
    change_column(:payments, :effective_month, :string)
  end
end
