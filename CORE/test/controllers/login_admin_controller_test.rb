require 'test_helper'

class LoginAdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login3" do
    get :login3
    assert_response :success
  end

  test "should get logout3" do
    get :logout3
    assert_response :success
  end

end
