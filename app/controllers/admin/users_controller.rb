class Admin::UsersController < ApplicationController
  before_filter :require_user
  layout 'admin'
  #access_control :DEFAULT => 'admin' #Need to be solved role error......
  def index
    @users = User.all
  end

end
