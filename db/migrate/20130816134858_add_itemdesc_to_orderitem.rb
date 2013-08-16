class AddItemdescToOrderitem < ActiveRecord::Migration
  def change
    add_column :orderitems, :itemdesc, :string
  end
end
