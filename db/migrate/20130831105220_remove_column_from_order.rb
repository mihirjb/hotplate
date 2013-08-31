class RemoveColumnFromOrder < ActiveRecord::Migration
  def up
    remove_column :users, :userphonenumber
  end

  def down
  end
end
