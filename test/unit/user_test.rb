require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
setup :activate_authlogic

  test "invalid email" do
    user = User.new(:email => 'bbb@gmail.com')
    assert user.errors.invalid?(:email)
  end
#  test "for blank Login Name" do
#    user = User.new
#    user.login = users(:blank).login
#    assert_present user.login
#  end
#
#  test "for blank Email Id" do
#    user = User.new
#    user.email = users(:blank).email
#    assert_present user.email
#  end
#
#  test "for blank Password" do
#    user = User.new
#    user.password = "one"
#    assert_present user.password
#  end
#
#  test "for blank Password confirmation" do
#    user = User.new
#    user.password_confirmation = "one"
#    assert_present user.password_confirmation
#  end
#
#  test "same password and password_confirmation" do
#    user = User.new
#    user.password = "one"
#    user.password_confirmation = "one"
#    assert_equal(user.password, user.password_confirmation, "Password and Password Confirmation not matching")
#  end
#
#  test "length of login name" do
#    user = User.create(:login => "tee", :email => "y@y.com", :password => "one", :password_confirmation => "one")
#    user.login.length >= 3 ? (assert true) : (assert false, "Login Name should be greater then or equal to 3 characters")
#  end
#
#  test "length of email id" do
#    user = User.create(:login => "tee1", :email => "a@y.com", :password => "one", :password_confirmation => "one")
#    user.email.length >= 6 ? (assert true) : (assert false, "Email should be greater then or equal to 6 characters")
#  end
#
#  test "length of password" do
#    user = User.create(:login => "tee12", :email => "a1@y.com", :password => "one1", :password_confirmation => "one1")
#    user.password.length >= 4 ? (assert true) : (assert false, "Password should be greater then or equal to 4 characters")
#  end
#
#  test "length of password_confirmation" do
#    user = User.create(:login => "tee12", :email => "a1@y.com", :password => "one1", :password_confirmation => "one1")
#    user.password_confirmation.length >= 4 ? (assert true) : (assert false, "Password confirmation should be greater then or equal to 4 characters")
#  end

  
######Checking for uniqueness
#  test "checking for unique login" do
#    users = User.all
#    user = User.new
#    user.login = "shri"
#    assert_not_equal
#  end

  
#  test "length of login name" do
#      user = User.new
#      user.login = "shripad"
#      user.email = "shripad1@gmail.com"
#      user.password = "shripad"
#      user.password_confirmation = "shripad"
#      assert user.save!
#    end

#  def test_validations
#    assert_attribute_required :login, :length=>(4..20), :unique=>true
#    assert_attribute_required :password, :length=>(4..20), :confirmed=>:password_confirmation
#    assert_attribute_required :email
#  end


end
