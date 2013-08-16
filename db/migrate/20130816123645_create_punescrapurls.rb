class CreatePunescrapurls < ActiveRecord::Migration
  def change
    create_table :punescrapurls do |t|
      t.string :tkurl
      t.string :zurl
      t.string :status

      t.timestamps
    end
  end
end
