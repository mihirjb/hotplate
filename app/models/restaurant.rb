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
#  latitude         :float
#  longitude        :float
#

class Restaurant < ActiveRecord::Base
  attr_accessible :restabout, :restdelmin, :restdeltime, :restname, :restphone, :raddress, :rarea, :rtimings, :rdelradius :restusername,:restemail,:city,:deliveryarea,:delivers, :latitude, :longitude
  
  has_many :menuitems
  has_many :orderitems
  has_many :orders
  has_many :reviews
  
  geocoded_by :restaddress                # can also be an IP address
  after_validation :geocode               # auto-fetch coordinates
  
  
  # validates_presence_of :restabout
  validates_presence_of :restdelmin
  validates_presence_of :raddress
  # validates_presence_of :restdeltime
  validates_presence_of :restname
  #validates_presence_of :restphone	
 # validates_presence_of :restemail
  validates_presence_of :city
#  validates_presence_of :deliveryarea
  validates_presence_of :delivers
  validates_presence_of :rtimings
  validates :restusername, :presence =>true, :uniqueness =>true

    def restaddress
      [restaddressline1, restaddressline2, city].compact.join(', ')
    end
    
  
  
end
