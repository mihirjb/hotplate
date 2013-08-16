# == Schema Information
#
# Table name: punescrapurls
#
#  id         :integer          not null, primary key
#  tkurl      :string(255)
#  zurl       :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Punescrapurl < ActiveRecord::Base
  attr_accessible :status, :tkurl, :zurl
  
  validates :zurl, :presence => true, :uniqueness => true
  validates_presence_of :tkurl
  validates_presence_of :status
  
end
