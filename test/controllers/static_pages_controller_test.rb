require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "GSBC - Home"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "GSBC - About"
  end

  test "should get tutorials" do
    get :tutorials
    assert_response :success
    assert_select "title", "GSBC - Tutorials"
  end

end
