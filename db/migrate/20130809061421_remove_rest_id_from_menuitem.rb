class RemoveRestIdFromMenuitem < ActiveRecord::Migration
  def up
    remove_column :menuitems, :rest_id
  end

  def down
    add_column :menuitems, :rest_id, :integer
  end
end
