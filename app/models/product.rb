class Product < ActiveRecord::Base
  belongs_to :account_user

  attr_accessor :image, :file, :video
  has_many :images, as: :imageable, :dependent => :destroy
  accepts_nested_attributes_for :images

  has_many :videos, as: :videoable, :dependent => :destroy
  accepts_nested_attributes_for :videos

  def wished(user_id, product_id)
    product = Wishing.where(:account_user_id => user_id, :product_id => product_id)
    return (product.blank? ? false : true)
  end

end