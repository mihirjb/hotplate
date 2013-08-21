class AddRcostToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :rcost, :integer
  end
end
