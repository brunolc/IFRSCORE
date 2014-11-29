require 'test_helper'

class CurriculosControllerTest < ActionController::TestCase
  test "should get editar_curriculo" do
    get :editar_curriculo
    assert_response :success
  end

  test "should get edit_curriculo" do
    get :edit_curriculo
    assert_response :success
  end

end
