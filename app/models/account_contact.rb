class AccountContact < ActiveRecord::Base
  belongs_to :account_user

  before_validation do primary_phone = primary_phone.to_s.gsub(/\D/, '') end
  before_validation do secondary_phone = secondary_phone.to_s.gsub(/\D/, '') end

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_format_of :primary_email, :with => EMAIL_REGEX, :allow_blank => true
  validates_format_of :secondary_email, :with => EMAIL_REGEX, :allow_blank => true
end
