class TeamMailer < ActionMailer::Base
  default from: "info@balloonchallenge.org"

  def new_team(user, team)
    @user = user
    @team = team
    @url = url_for(@team)
    mail(to: @user.email, subject: "Thanks for creating a team!")
  end

  def added_user(user, team)
    @user = user
    @team = team
    @url = url_for(@team)
    mail(to: @user.email, subject: "You've been added to the team \"#{@team.name}\" on the Global Space Balloon Challenge")
  end
end
