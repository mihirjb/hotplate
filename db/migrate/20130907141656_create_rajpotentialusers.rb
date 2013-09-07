class CreateRajpotentialusers < ActiveRecord::Migration
  def change
    create_table :rajpotentialusers do |t|
      t.string :email

      t.timestamps
    end
  end
end
