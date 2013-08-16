class RemoveColumnFromOrderitem < ActiveRecord::Migration
  def up
    remove_column :orderitems, :itemdesc
  end

  def down
    add_column :orderitems, :itemdesc,:string
    
  end
end
