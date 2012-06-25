require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get policy" do
    get :policy
    assert_response :success
  end

  test "should get community" do
    get :community
    assert_response :success
  end

end
