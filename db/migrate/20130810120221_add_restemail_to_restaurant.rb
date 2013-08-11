class AddRestemailToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :restemail, :string
  end
end
