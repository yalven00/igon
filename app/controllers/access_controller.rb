class AccessController < ApplicationController

  layout "brochure"

  def login
  end

  def attempt_login
    if !User.authenticate(params[:password])
      session[:user_id] = "356a192b7913b04c54574d18c28d46e6395428ab";
      redirect_to(:action => "index", :controller => "brochure")
    else
      flash[:notice] = "Invalid password."
      redirect_to(:action => "login")
    end

  end

  def attempt_account_login
    authorized_user = AccountUser.authenticate(params[:email], params[:password])
    respond_to do |format|
      if authorized_user
        session[:account_user_id] = authorized_user.id
        format.json { render :json => "" }
        format.html { redirect_to(:action => "home", :controller => "my_account") }
      else
        flash[:notice] = "Invalid username/password combination."
        format.json { render :json => "", :status => :unprocessable_entity }
        format.html { redirect_to(:back) }
      end
    end

  end

  def logout
    session[:user_id] = nil
    session[:account_user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end

end
