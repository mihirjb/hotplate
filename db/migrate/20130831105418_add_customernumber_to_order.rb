class AddCustomernumberToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :customernumber, :string
  end
end
