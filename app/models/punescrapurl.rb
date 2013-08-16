class Punescrapurl < ActiveRecord::Base
  attr_accessible :status, :tkurl, :zurl
  
  validates :zurl, :presence => true, :uniqueness => true
  validates_presence_of :tkurl
  validates_presence_of :status
  
end
