##Given /^I have categories titled (.+)$/ do |titles|
##  titles.split(', ').each do |title|
##    Category.create(:title => title)
##  end
##end
#
##Given /^the following user records$/ do |table|
##  table.hashes.each do |hash|
##    Factory(:user,hash)
##  end
##end
#
#Given /^the following (.+) records?$/ do |factory, table|
#  table.hashes.each do |hash|
#    #Factory(factory, hash)
#    Factory(:user,:roles => [Factory(:role,:title => 'admin')])
#    #Factory(:user_with_role, hash)
#    #user_with_role
#  end
#end
#
#Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
#  visit admin_login_url
#  fill_in "Login", :with => login
#  fill_in "Password", :with => password
#  click_button "Login"
#end
#
#Then /^I should see the welcome page$/ do
#  visit admin_welcome_url
#  #visit root_url
#end
