class AddItemdescToMenuitem < ActiveRecord::Migration
  def change
    add_column :menuitems, :itemdesc, :string
  end
end
