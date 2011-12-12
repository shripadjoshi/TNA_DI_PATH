#require 'factory_girl'
#
#Factory.define :role do |r|
#  puts "Role called...."
#  r.title{'admin'}
#end
#Factory.define :user do |f|
#  puts "user called....."
#  f.login{'admin'}
#  f.password{'admin'}
#  f.password_confirmation { |u| u.password }
#  f.email{'admin@tnadi.com'}
#  #f.association(:role, :title => 'admin')
#  #f.association(:role)
#
#end
#
##Factory.define :user_with_role, :parent => :user do |user|
##  puts "user_with_role called"
##  user.after_create { |a| Factory(:role, :user => a) }
##end