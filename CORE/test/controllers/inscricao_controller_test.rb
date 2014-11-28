require 'test_helper'

class InscricaoControllerTest < ActionController::TestCase
  test "should get cadastra" do
    get :cadastra
    assert_response :success
  end

end
