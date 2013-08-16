class AddColumnsToRestaurant < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :raddress, :string
    add_column :restaurants, :rtimings, :string
    add_column :restaurants, :rdelradius, :integer
    add_column :restaurants, :rarea, :string
    
   end
   
   
   def self.down
      remove_column :restaurants, :raddress
       remove_column :restaurants, :rtimings
       remove_column :restaurants, :rdelradius
       remove_column :restaurants, :rarea
   
   end
end
