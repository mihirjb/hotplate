# == Schema Information
#
# Table name: menuitems
#
#  id            :integer          not null, primary key
#  itemname      :string(255)
#  itemunitprice :decimal(, )
#  itemcategory  :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#

class Menuitem < ActiveRecord::Base
  attr_accessible :itemcategory, :itemname, :itemunitprice, :restaurant_id
  belongs_to :restaurant
end
