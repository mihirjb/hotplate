# == Schema Information
#
# Table name: beentheres
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Beenthere < ActiveRecord::Base
  attr_accessible :restaurant_id, :user_id
  
  belongs_to :user
  belongs_to :restaurant
  
end
