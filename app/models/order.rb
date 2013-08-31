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
#  customernumber  :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :customernumber, :customeraddress, :customername,:restaurant_id, :total,:customeremail,:user_id
  
  has_many :orderitems
  belongs_to :restaurant
  belongs_to :users
    
  validates_presence_of :customernumber
  validates_presence_of :customeraddress
  validates_presence_of :customername
  validates_presence_of :user_id
  validates_presence_of :restaurant_id
  validates_presence_of :customeremail
  validates_presence_of :total
 
  
  
end
