class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customername
      t.integer :custoemrnumber
      t.text :customeraddress

      t.timestamps
    end
  end
end
