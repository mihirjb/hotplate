class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :restaurants, :restaddressline1
    remove_column :restaurants, :restaddressline2
    remove_column :restaurants, :restimingfrom
    remove_column :restaurants, :resttiminigto

  end

  def down
  end
end
