require 'test_helper'

class ErrosControllerTest < ActionController::TestCase
  test "should get logado" do
    get :logado
    assert_response :success
  end

  test "should get ativar" do
    get :ativar
    assert_response :success
  end

  test "should get erro_sessao" do
    get :erro_sessao
    assert_response :success
  end

  test "should get erro_404" do
    get :erro_404
    assert_response :success
  end

end
