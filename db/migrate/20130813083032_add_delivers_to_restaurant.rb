class AddDeliversToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :delivers, :boolean
  end
end
