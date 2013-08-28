class AddUserphonenumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :userphonenumber, :string
  end
end
