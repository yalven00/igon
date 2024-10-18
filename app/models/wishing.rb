class Wishing < ActiveRecord::Base


  # validations
  #++
  validates :account_user_id, :presence => true
  validates :community_id, :presence => true
  validates :product_id, :presence => true
  #--

end
