require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get callback" do
    get :callback
    assert_response :success
  end

  test "should get feed" do
    get :feed
    assert_response :success
  end

end
