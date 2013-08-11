class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.string :itemname
      t.integer :quantity
      t.integer :itemprice

      t.timestamps
    end
  end
end
