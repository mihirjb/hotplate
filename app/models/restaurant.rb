# == Schema Information
#
# Table name: restaurants
#
#  id               :integer          not null, primary key
#  restusername     :string(255)
#  restname         :string(255)
#  restaddressline1 :string(255)
#  restaddressline2 :string(255)
#  restphone        :integer
#  resttimingfrom   :time
#  resttiminigto    :time
#  restdeltime      :string(255)
#  restdelmin       :string(255)
#  restabout        :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  restemail        :string(255)
#  city             :string(255)
#  deliveryarea     :string(255)
#  delivers         :boolean
#

class Restaurant < ActiveRecord::Base
  attr_accessible :restabout, :restaddressline1, :restaddressline2, :restdelmin, :restdeltime, :restname, :restphone, :resttimingfrom, :resttiminigto, :restusername,:restemail,:city,:deliveryarea,:delivers
  
  has_many :menuitems
  has_many :orderitems
  has_many :orders
  
  
end
