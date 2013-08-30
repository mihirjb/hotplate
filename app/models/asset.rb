class Asset < ActiveRecord::Base
  attr_accessible :image_content_type, :image_file_name, :image_file_size, :restaurant_id, :image
  
  belongs_to :restaurant
  
  has_attached_file :image,
      :styles => {
        :thumb=> "100x100#",
        :small  => "300x300>",
        :large => "600x600>"
          }
  
  
end
