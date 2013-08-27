# == Schema Information
#
# Table name: restaurants
#
#  id             :integer          not null, primary key
#  restusername   :string(255)
#  restname       :string(255)
#  restphone      :integer
#  resttimingfrom :time
#  restdeltime    :string(255)
#  restdelmin     :string(255)
#  restabout      :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  restemail      :string(255)
#  city           :string(255)
#  deliveryarea   :string(255)
#  delivers       :boolean
#  latitude       :float
#  longitude      :float
#  raddress       :string(255)
#  rtimings       :string(255)
#  rdelradius     :integer
#  rarea          :string(255)
#  rcost          :integer
#  gmaps          :boolean
#  onlyveg        :boolean
#

class Restaurant < ActiveRecord::Base
  attr_accessible :restabout, :restdelmin, :restdeltime, :restname, :restphone, :raddress, :rarea, :rtimings, :rdelradius, :restusername,:restemail,:city,:deliveryarea,:delivers, :latitude, :longitude, :rcost, :gmaps, :onlyveg,:rfeatures,:rcuisine
  
  has_many :menuitems, :dependent => :destroy
  has_many :orderitems
  has_many :orders
  has_many :reviews, :dependent => :destroy
  
                # auto-fetch coordinates

                acts_as_gmappable

                def gmaps4rails_address
                  "#{self.restname},#{self.rarea}, #{self.city}" 
                end


            

  # validates_presence_of :restabout
 # validates_presence_of :restdelmin
  validates_presence_of :raddress
  # validates_presence_of :restdeltime
   validates_presence_of :restname
  #validates_presence_of :restphone	
 # validates_presence_of :restemail
   validates_presence_of :city
#  validates_presence_of :deliveryarea
   #validates_presence_of :delivers
 validates_presence_of :rtimings
 # validates :restusername, :presence =>true
    validates_presence_of :rcost
   
    
  
  
end
