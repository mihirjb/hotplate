class CreateMenuitems < ActiveRecord::Migration
  def change
    create_table :menuitems do |t|
      t.string :itemname
      t.decimal :itemunitprice
      t.string :itemcategory

      t.timestamps
    end
  end
end
