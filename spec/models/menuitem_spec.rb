# == Schema Information
#
# Table name: menuitems
#
#  id            :integer          not null, primary key
#  itemname      :string(255)
#  itemunitprice :decimal(, )
#  itemcategory  :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#

require 'spec_helper'

describe Menuitem do
  pending "add some examples to (or delete) #{__FILE__}"
end
