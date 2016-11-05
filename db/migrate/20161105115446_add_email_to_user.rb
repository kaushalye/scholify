class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :user, :email, :string
  end
end
