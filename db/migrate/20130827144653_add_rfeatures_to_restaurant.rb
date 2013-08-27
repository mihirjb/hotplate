class AddRfeaturesToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :rfeatures, :string
  end
end
