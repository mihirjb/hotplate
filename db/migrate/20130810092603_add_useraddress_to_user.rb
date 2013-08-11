class AddUseraddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :useraddress, :string
  end
end
