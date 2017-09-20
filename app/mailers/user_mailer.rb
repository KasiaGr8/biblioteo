class UserMailer < ActionMailer::Base

  def daily_mail(user)
    @user = user
    mail to: user.email, subject: "It's time to smile"
  end

end