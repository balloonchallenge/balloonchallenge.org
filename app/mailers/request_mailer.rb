class RequestMailer < ActionMailer::Base
  default from: "info@balloonchallenge.org"
  def new_request(user, team)
    @team = team
    @user = user
    @users = team.users
    @url = url_for(@team)
    emails = @users.collect(&:email).join(",")
    mail(to: emails, subject: "A user has requested to join your team")
  end
end
