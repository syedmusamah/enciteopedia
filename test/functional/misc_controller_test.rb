require 'test_helper'

class MiscControllerTest < ActionController::TestCase
  test "should get policy" do
    get :policy
    assert_response :success
  end

  test "should get community" do
    get :community
    assert_response :success
  end

end
