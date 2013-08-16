class CreateMumscrapurls < ActiveRecord::Migration
  def change
    create_table :mumscrapurls do |t|
      t.string :tkurl
      t.string :zurl
      t.string :status

      t.timestamps
    end
  end
end
