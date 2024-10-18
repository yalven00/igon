class Address < ActiveRecord::Base
  belongs_to :account_user
  validates_presence_of :country
  validates_presence_of :zip
  validates_length_of :zip, :is => 5
end
