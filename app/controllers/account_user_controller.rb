class AccountUserController < ApplicationController

  #before_filter :confirm_logged_in

  layout "brochure"

  def index
  end

  def new
    @account_user = AccountUser.new
    @account_user.build_address
  end

  def create
    @account_user = AccountUser.new(params[:account_user])
    @account_user.ip = request.remote_ip

    respond_to do |format|
      if @account_user.save
        session[:account_user_id] = @account_user.id
        @account_user.create_account_contact
        @account_user.create_preference_list
        @account_user.create_profile
        #format.json { render :json => "", redirect_to :action => :needs }
        format.html {redirect_to :action => :needs}
      else
        if @account_user.errors.size > 0
          errors = @account_user.errors.full_messages.join(' - ')
        end
        flash[:notice] = errors
        format.html {render :new}
        #format.json {render :json => { :error => errors }, :status => :unprocessable_entity }
      end
    end

  end

  def needs
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def needs_update
    @account_user = AccountUser.find(session[:account_user_id])
    #respond_to do |format|
      if @account_user.update_attributes(params[:account_user])
        #flash[:notice] = "Success."
        redirect_to(:action => 'skills')
        #format.js
      else
        if @account_user.errors.size > 0
          errors = @account_user.errors.full_messages.join(' - ')
        end
        flash[:notice] = errors
        render("needs")
        #format.js
      end

      #format.html {redirect_to(:back)}
  end

  def skills
    @account_user = AccountUser.find(session[:account_user_id])
  end

  def skills_update
    @account_user = AccountUser.find(session[:account_user_id])
    #respond_to do |format|
      if @account_user.update_attributes(params[:account_user])
        #flash[:notice] = "Success."
        redirect_to(:action => 'connections')
        #format.js
      else
        if @account_user.errors.size > 0
          errors = @account_user.errors.full_messages.join(' - ')
        end
        flash[:notice] = errors
        render("skills")
        #format.js
      end

      #format.html {redirect_to(:back)}
  end

  def connections
  end
end
