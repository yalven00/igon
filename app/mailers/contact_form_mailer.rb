class ContactFormMailer < ActionMailer::Base
  default :to => "joshuabeckerman@gmail.com"

  def contact_form_email(feedback)
    @feedback = feedback
    mail(:from => feedback.first_name + " " + feedback.last_name, :subject => "igobono Contact Form")
  end

  def autorespond(feedback)
    @feedback = feedback
    mail(:to => feedback.email, :from => "igobono <info@igobono.com>", :reply_to => "feedback@igobono.com", :subject => "Thanks, We Received Your Message")
  end

end
