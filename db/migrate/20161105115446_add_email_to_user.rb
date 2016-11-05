class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :email
  end
end
