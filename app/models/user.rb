class User < ActiveRecord::Base
  
  #This will protect from mass assignment
  attr_accessible :login, :email, :password, :password_confirmation, :openid_identifier

  ######This block u can enter authlogic parameters..............
  acts_as_authentic do |c|
    ###Here various options for authlogic you can enter....
  end

  has_and_belongs_to_many :roles

  #####By using following method user will be able to login by username or email address
  def self.find_by_login_or_email(login)
    User.find_by_login(login) || User.find_by_email(login)
  end

  #This method will return the state of the user as true if active false if not active
  def active?
    active
  end

  ##This will activate the user by setting the active value true
  def activate!
    self.active = true
    save
  end

  #This will send activation instruction to the user mail id by calling mailer method deliver_activation_instructions
  def deliver_activation_instructions!
    reset_perishable_token!
    Mailer.deliver_activation_instructions(self)
  end

  #This will send confirmation message to the user mail id by calling mailer method deliver_activation_confirmation
  def deliver_activation_confirmation!
    reset_perishable_token!
    Mailer.deliver_activation_confirmation(self)
  end

  ###This method is used to deliver the reset password instruction mail 
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Mailer.deliver_password_reset_instructions(self)
  end
end
