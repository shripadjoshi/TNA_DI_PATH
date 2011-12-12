class Mailer < ActionMailer::Base
  def activation_instructions(user)
    subject       "TNA DI PATH Activation Instructions"
    from          "tnadipath@gmail.com"
    recipients    user.email
    sent_on       Time.now
    @content_type = "text/html"
    @body[:account_activation_url] = register_url(user.perishable_token)
    @body[:user] = user
  end

  def activation_confirmation(user)
    subject       "TNA DI PATH Activation Complete"
    from          "tnadipath@gmail.com"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

  def password_reset_instructions(user)
    subject      "Password Reset Instructions"
    from         "tnadipath@gmail.com"
    recipients   user.email
    content_type "text/html"
    sent_on      Time.now
    body         :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end


end
