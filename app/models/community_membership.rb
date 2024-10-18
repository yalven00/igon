class CommunityMembership < ActiveRecord::Base

  belongs_to :community
  belongs_to :account_user

  # validations
  #++
  validates :account_user_id, :presence => true
  validates :community_id, :presence => true
  #--

end
