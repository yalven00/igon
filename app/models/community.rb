class Community < ActiveRecord::Base
  acts_as_commentable

  has_many :community_memberships
  has_many :account_users, :through => :community_memberships

  attr_accessor :image, :file, :video
  has_many :images, as: :imageable, :dependent => :destroy
  accepts_nested_attributes_for :images

  has_many :videos, as: :videoable, :dependent => :destroy
  accepts_nested_attributes_for :videos

  def self.with_images
    includes(:images)
  end

end
