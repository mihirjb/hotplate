# == Schema Information
#
# Table name: orderitems
#
#  id                 :integer          not null, primary key
#  itemname           :string(255)
#  quantity           :integer
#  itemprice          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  restaurant_id      :integer
#  order_id           :integer
#  specialinstruction :text
#

class Orderitem < ActiveRecord::Base
  attr_accessible :itemname, :itemprice, :quantity,:order_id,:restaurant_id, :specialinstruction
  
  belongs_to :order
  belongs_to :restaurant
  
  validates_presence_of :itemname
  validates_presence_of :itemprice
  validates_presence_of :quantity
  validates_presence_of :order_id
  validates_presence_of :restaurant_id
  
  
end
