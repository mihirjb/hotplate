# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  customername    :string(255)
#  custoemrnumber  :integer
#  customeraddress :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  restaurant_id   :integer
#  total           :integer
#  customeremail   :string(255)
#  user_id         :integer
#

class Order < ActiveRecord::Base
  attr_accessible :custoemrnumber, :customeraddress, :customername,:restaurant_id, :total,:customeremail,:user_id
  
  has_many :orderitems
  belongs_to :restaurant
  belongs_to :users
  
end
