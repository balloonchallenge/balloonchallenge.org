require 'test_helper'
class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:luke)
  end

  test "User has name" do
    
    assert @user.name == "Luke Wright"
  end

  test "user has email" do
    assert @user.email == "luke@simplyluke.com"
  end
end
