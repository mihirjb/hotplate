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

require 'spec_helper'

describe Restaurant do
  pending "add some examples to (or delete) #{__FILE__}"
end
