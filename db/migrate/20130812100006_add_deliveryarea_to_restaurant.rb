class AddDeliveryareaToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :deliveryarea, :string
  end
end
