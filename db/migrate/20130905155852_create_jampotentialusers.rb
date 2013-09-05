class CreateJampotentialusers < ActiveRecord::Migration
  def change
    create_table :jampotentialusers do |t|
      t.string :email

      t.timestamps
    end
  end
end
