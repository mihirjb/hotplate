class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restusername
      t.string :restname
      t.string :restaddressline1
      t.string :restaddressline2
      t.integer :restphone
      t.time :resttimingfrom
      t.time :resttiminigto
      t.string :restdeltime
      t.string :restdelmin
      t.text :restabout

      t.timestamps
    end
  end
end
