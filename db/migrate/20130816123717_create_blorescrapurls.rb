class CreateBlorescrapurls < ActiveRecord::Migration
  def change
    create_table :blorescrapurls do |t|
      t.string :tkurl
      t.string :zurl
      t.string :status

      t.timestamps
    end
  end
end
