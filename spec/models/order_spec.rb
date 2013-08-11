# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  customername    :string(255)
#  custoemrnumber  :integer
#  customeraddress :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  restaurant_id   :integer
#  total           :integer
#

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
