class FeedbackController < ApplicationController

  before_filter :confirm_logged_in

  def create
      @feedback = Feedback.new(params[:feedback])

        respond_to do |format|
           if @feedback.valid?
             ContactFormMailer.contact_form_email(@feedback).deliver
             ContactFormMailer.autorespond(@feedback).deliver
             flash[:notice] = "Your message was sent! We will do our best to answer your questions as soon as possible."
             format.json {render :json => true, :status => :ok}
           else
             if @feedback.errors.size > 0
               errors = @feedback.errors.full_messages.join(' - ')
             end
             flash[:notice] = errors
             format.json {render :json => errors}
           end
            format.html {redirect_to(:back)}
          end
    end

end
