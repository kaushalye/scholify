class AddSponsorToBadDebt < ActiveRecord::Migration
  def change
    add_reference :bad_debts, :sponsor, index: true, foreign_key: true
  end
end
