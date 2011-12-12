class PasswordResetsController < ApplicationController
  #these are all filter which will tell the controller need to log into the system and load the user using perishable token
  before_filter :require_user
  before_filter :load_user_using_perishable_token, :only => [:edit,:update]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you"
      redirect_to root_path
    else
      flash[:notice] = "No user was found with email address #{params[:email]}"
      render :action => :new
    end
  end

  def edit
  end

  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password]
    if @user.save
      flash[:success] = "Your password was successfully updated"
      redirect_to @user
    else
      render :action => :edit
    end
  end

  private

  ##This private method will fetch the details based on perishable token
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = "We're sorry, but we could not locate your account"
      redirect_to root_url
    end
  end
end
