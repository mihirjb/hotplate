class AddSpecialinstructionToOrderitem < ActiveRecord::Migration
  def change
    add_column :orderitems, :specialinstruction, :text
  end
end
