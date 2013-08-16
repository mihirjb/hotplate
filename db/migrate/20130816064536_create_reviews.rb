class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :reviewtext
      t.string :author
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
