class AddOnlyvegToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :onlyveg, :boolean
  end
end
