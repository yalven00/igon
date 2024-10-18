class Video < ActiveRecord::Base
  belongs_to :videoable, polymorphic: true
  attr_accessible :video, :videoable_id, :videoable_type, :name, :caption
  mount_uploader :video, VideoUploader
end
