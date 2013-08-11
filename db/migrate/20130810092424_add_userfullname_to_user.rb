class AddUserfullnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :userfullname, :string
  end
end
