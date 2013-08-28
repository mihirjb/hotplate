class RemoveColumnFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :userphonenumber
  end

  def down
    add_column :users, :userphonenumber, :integer
  end
end
