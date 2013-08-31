class CreateBeentheres < ActiveRecord::Migration
  def change
    create_table :beentheres do |t|
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
