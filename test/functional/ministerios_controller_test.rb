require 'test_helper'

class MinisteriosControllerTest < ActionController::TestCase
  setup do
    @ministerio = ministerios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ministerios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ministerio" do
    assert_difference('Ministerio.count') do
      post :create, ministerio: { descricao: @ministerio.descricao, titulo: @ministerio.titulo }
    end

    assert_redirected_to ministerio_path(assigns(:ministerio))
  end

  test "should show ministerio" do
    get :show, id: @ministerio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ministerio
    assert_response :success
  end

  test "should update ministerio" do
    put :update, id: @ministerio, ministerio: { descricao: @ministerio.descricao, titulo: @ministerio.titulo }
    assert_redirected_to ministerio_path(assigns(:ministerio))
  end

  test "should destroy ministerio" do
    assert_difference('Ministerio.count', -1) do
      delete :destroy, id: @ministerio
    end

    assert_redirected_to ministerios_path
  end
end
