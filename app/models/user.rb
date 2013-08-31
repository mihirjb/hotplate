# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(128)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  userfullname           :string(255)
#  useraddress            :string(255)
#  latitude               :float
#  longitude              :float
#  city                   :string(255)
#  userphonenumber        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :userfullname, :userphonenumber, :useraddress,:id,:latitude, :longitude, :city
  # attr_accessible :title, :body
  
  has_many :favorites
  has_many :restaurants, :through => :favorites
  
   has_many :beetheres
   has_many :visitedhotels, :through => :beentheres, :source => :restaurants
  
  has_many :orders
  has_many :reviews
  acts_as_gmappable :process_geocoding => false
  
  geocoded_by :useraddress                # can also be an IP address
   after_validation :geocode              # auto-fetch coordinates
   
   valid_email_format = /[\w+\-.]+@[a-z\-.]+\.[a-z]+/i

   validates_presence_of :userfullname
   validates_length_of :userfullname, :maximum => 50
   validates :email, :presence => true,:format => valid_email_format, :uniqueness => true
  validates_length_of :password,:in => 6..40, :on=>:create
   validates_length_of :userphonenumber,:in => 10..12
   validates :password, :confirmation  => true
  
  
end
