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

require 'spec_helper'

describe Review do
  pending "add some examples to (or delete) #{__FILE__}"
end
