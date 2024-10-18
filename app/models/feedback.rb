class Feedback < ActiveRecord::Base

    attr_accessor :first_name, :last_name, :email, :message

    validates :first_name,  :presence => true
    validates :message,  :presence => true
    validates :email,  :presence => true, :format => { :with => %r{.+@.+\..+} }

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end

end
