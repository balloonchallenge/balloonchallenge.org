# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Request < ActiveRecord::Base
  belongs_to :team

  def user_email
    id = self.user_id
    email = User.find(id).email
    return email
  end
end
