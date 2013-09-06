class Potentialuser < ActiveRecord::Base
  attr_accessible :email, :restaurant_id
  valid_email_format = /[\w+\-.]+@[a-z\-.]+\.[a-z]+/i
  validates :email, :presence => true,:format => valid_email_format, :uniqueness => true
  
end
