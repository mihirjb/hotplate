# == Schema Information
#
# Table name: orderitems
#
#  id            :integer          not null, primary key
#  itemname      :string(255)
#  quantity      :integer
#  itemprice     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#  order_id      :integer
#

require 'spec_helper'

describe Orderitem do
  pending "add some examples to (or delete) #{__FILE__}"
end
