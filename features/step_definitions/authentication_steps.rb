# Authlogic ~ Cucumber Authentication Steps

# Activate AuthLogic prior to testing

Before do
include Authlogic::TestCase
activate_authlogic
end

#
# Helper Methods available to other steps
#

def create_user(login)
  @current_user = User.new(
    :login => login,
    :password => 'admin',
    :password_confirmation => 'admin',
    :email => "#{login}@tnadi.com"
  )
  @role = Role.create!(:title => "admin")
  @current_user.roles << @role
  @current_user.save!
end

def login_user
  visit admin_login_url
  fill_in("login", :with => @current_user.login)
  fill_in("password", :with => 'admin')
  click_button("Login")
end

def logout_user
session = UserSession.find
session.destroy if session
end

def user_session
  #@session ||= UserSession.find
  @session ||= UserSession.find
end

#
# Cucumber Assertions
#

Given /^I am not logged in$/ do
  logout_user
end

Given /^I am the user "([^\"]*)"$/ do |login|
  create_user login
end

When /^I Log In$/ do
  login_user
end

Then /^there should be a session$/ do
  user_session
  @session != nil
  #@session.should_not be nil
end

Then /^the user should be "([^\"]*)"$/ do |login|
  user_session
  puts "--------------"
  puts @session.blank?
  puts @session.user
  puts "--------------"
  @session.user.login.should be == login
end
