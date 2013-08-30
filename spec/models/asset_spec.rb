# == Schema Information
#
# Table name: assets
#
#  id                 :integer          not null, primary key
#  restaurant_id      :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe Asset do
  pending "add some examples to (or delete) #{__FILE__}"
end
