class UserMailer < ActionMailer::Base
  default from: "info@balloonchallenge.org"

  def new_user(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to the Global Space Balloon Challenge!")
  end
end
