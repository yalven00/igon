class BrochureController < ApplicationController

  #before_filter :confirm_logged_in

  def index
  end

  def about
  end

  def terms
  end

  def contact
    @feedback = Feedback.new
  end

end