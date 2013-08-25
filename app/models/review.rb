# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  reviewtext    :text
#  author        :string(255)
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  score         :integer
#

class Review < ActiveRecord::Base
  attr_accessible :author, :restaurant_id, :reviewtext, :title, :user_id, :score
  
  belongs_to :user
  belongs_to :restaurant
  
  validates_presence_of :score
  validates_presence_of :author
  validates_presence_of :restaurant_id	
  validates_presence_of :reviewtext
  validates_presence_of :title
  validates_presence_of :user_id
    
end
