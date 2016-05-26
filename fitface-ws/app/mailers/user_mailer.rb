class UserMailer < ActionMailer::Base
  include Resque::Mailer
  default from: APP_CONFIG['email']

  def notify_login(user)
    @user = User.find_by_id(user)
    mail(:to => @user.email, :subject => "Login Attempt on FitFace!")
  end

  def reset_password(user, password)
    @user = User.find_by_id(user)
    @password = password
    
    mail(to: @user.email, subject: "Reset Password!")
  end

end
