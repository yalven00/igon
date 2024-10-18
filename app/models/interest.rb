class Interest < ActiveRecord::Base
  has_and_belongs_to_many :account_users
end
