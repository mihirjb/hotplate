class CreatePotentialusers < ActiveRecord::Migration
  def change
    create_table :potentialusers do |t|
      t.string :email
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
