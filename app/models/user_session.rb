class UserSession < Authlogic::Session::Base
  #This will check entered username is login name or email
  find_by_login_method :find_by_login_or_email
end