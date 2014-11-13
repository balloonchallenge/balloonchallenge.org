class SessionsController < Devise::SessionsController
  def sso
    user = current_user
    secret = ENV["SSO_SECRET"]
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = user.email
    sso.name = user.name
    sso.external_id = user.id # unique to your application
    sso.sso_secret = secret

    redirect_to sso.to_url("http://community.balloonchallenge.org/session/sso_login")
  end
end
