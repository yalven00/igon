class User < ActiveRecord::Base
  require 'digest/sha1'

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates_presence_of :email
  validates_format_of :email, :with => EMAIL_REGEX

  def self.authenticate(password="")
      Digest::SHA1.hexdigest(password) == "ce37648fcb35443c8a7e44ca46bed0218029b494"
  end

end
