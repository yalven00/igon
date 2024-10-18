class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attr_accessible :image, :imageable_id, :imageable_type, :name, :caption
  mount_uploader :image, ImageUploader
end



