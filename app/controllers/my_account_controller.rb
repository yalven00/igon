class MyAccountController < ApplicationController

  before_filter :confirm_logged_in

  layout "internal"

  def update
    @account_user = AccountUser.find(session[:account_user_id])
    respond_to do |format|
      if @account_user.update_attributes(params[:account_user])
        format.html {redirect_to(:back)}
      else
        if @account_user.errors.size > 0
          errors = @account_user.errors.full_messages.join(' - ')
        end
        flash[:notice] = errors
        format.html {redirect_to(:back)}
      end
    end
  end

  def home
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def user_login
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def password
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def contact
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def personal
    @account_user = AccountUser.first#.find(session[:account_user_id])
  end

  def public_profile
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def skills
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def needs
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def bonos_history
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def merchant_account
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def default_preferences
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def security
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def cloud_connections
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def social_score
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def network_links
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def popover
    @community = Community.first
  end

end
