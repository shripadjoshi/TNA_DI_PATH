class Admin::AdminSessionsController < ApplicationController
  layout "admin"
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy]
  #TODO
  #Need to see why this  why this is not working
  #access_control [:destroy] => "admin"
  
  def new
    @user_session = UserSession.new
  end

  def create
    if User.find_by_login_or_email(params[:user_session][:login]).roles.collect(&:title).include?("admin")
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
      
        flash[:notice] = "Login successful!"
        #redirect_back_or_default root_url
        #redirect_back_or_default admin_admin_session_url
        #render :text => "Admin Logged in......"
        #redirect_to admin_users_path
        redirect_to admin_welcome_path
      else
        render :action => :new
      end
    else
      flash[:notice] = "Please Login as admin"
      render :text => "Not Admin......"
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to admin_login_path
  end
end
