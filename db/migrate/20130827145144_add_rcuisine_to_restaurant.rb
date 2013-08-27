class AddRcuisineToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :rcuisine, :string
  end
end
