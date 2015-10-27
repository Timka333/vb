class UsertobeMailer < ActionMailer::Base

  default from: "info@StileHQ.com"

  def invite_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
end
