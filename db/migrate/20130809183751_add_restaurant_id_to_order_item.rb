class AddRestaurantIdToOrderItem < ActiveRecord::Migration
  def change
    add_column :orderitems, :restaurant_id, :integer
  end
end
