class UsersController < ApplicationController

  before_filter :confirm_logged_in

  def create
    @user = User.new(params[:user])
    @user.ip = request.remote_ip

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        flash[:notice] = "Success."
        format.json {render :json => true, :status => :ok}
      else
        if @user.errors.size > 0
          errors = @user.errors.full_messages.join(' - ')
        end
        flash[:notice] = errors
        format.json {render :json => errors}
      end

      format.html {redirect_to(:back)}

    end

  end

end
