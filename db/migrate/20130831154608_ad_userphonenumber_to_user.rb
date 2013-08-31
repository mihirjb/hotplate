class AdUserphonenumberToUser < ActiveRecord::Migration
  def up
    add_column :users, :userphonenumber, :string
    
  end

  def down
  end
end
