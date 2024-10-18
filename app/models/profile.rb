class Profile < ActiveRecord::Base
  belongs_to :account_user
  mount_uploader :main_pic, ImageUploader
end