class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :restaurants, :resttimingfrom
    remove_column :restaurants, :resttiminigto

  end

  def down
  end
end
