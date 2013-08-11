# == Schema Information
#
# Table name: orderitems
#
#  id            :integer          not null, primary key
#  itemname      :string(255)
#  quantity      :integer
#  itemprice     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#  order_id      :integer
#

class Orderitem < ActiveRecord::Base
  attr_accessible :itemname, :itemprice, :quantity,:order_id,:restaurant_id
  
  belongs_to :order
  belongs_to :restaurant
  
end
