class Request < ActiveRecord::Base
  belongs_to :team

  def user_email
    id = self.user_id
    email = User.find(id).email
    return email
  end
end
