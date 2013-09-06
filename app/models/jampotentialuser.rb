class Jampotentialuser < ActiveRecord::Base
  attr_accessible :email
  
  valid_email_format = /[\w+\-.]+@[a-z\-.]+\.[a-z]+/i
  validates :email, :presence => true,:format => valid_email_format, :uniqueness => true
  
end
