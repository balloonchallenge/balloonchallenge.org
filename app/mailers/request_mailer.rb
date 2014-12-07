class RequestMailer < ActionMailer::Base
  default from: "info@balloonchallenge.org"
  def new_request(user, team)
    @team = team
    @user = user
    @url = url_for(@team)
    mail(to: user.email, subject: "A user has requested to join your team")
  end

  def self.send_new_request(team)
    team.users.each do |user|
      new_request(user, team).deliver
    end
  end
end
