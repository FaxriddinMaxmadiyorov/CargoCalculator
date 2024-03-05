class UserMailer < ApplicationMailer
  def notify_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end