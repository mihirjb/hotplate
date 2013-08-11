class AddOrderIdToOrderItem < ActiveRecord::Migration
  def change
    add_column :orderitems, :order_id, :integer
  end
end
