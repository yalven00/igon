class UserMailer < ActionMailer::Base
  default :from => "igobono <info@igobono.com>", :reply_to => "feedback@igobono.com"

  def welcome_email(user)
      @user = user
      mail(:to => user.email, :subject => "Welcome to igobono!")
    end
end
