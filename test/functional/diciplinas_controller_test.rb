require 'test_helper'

class DiciplinasControllerTest < ActionController::TestCase
  setup do
    @diciplina = diciplinas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diciplinas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diciplina" do
    assert_difference('Diciplina.count') do
      post :create, diciplina: { conteudo: @diciplina.conteudo, nome: @diciplina.nome, professor_id: @diciplina.professor_id }
    end

    assert_redirected_to diciplina_path(assigns(:diciplina))
  end

  test "should show diciplina" do
    get :show, id: @diciplina
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diciplina
    assert_response :success
  end

  test "should update diciplina" do
    put :update, id: @diciplina, diciplina: { conteudo: @diciplina.conteudo, nome: @diciplina.nome, professor_id: @diciplina.professor_id }
    assert_redirected_to diciplina_path(assigns(:diciplina))
  end

  test "should destroy diciplina" do
    assert_difference('Diciplina.count', -1) do
      delete :destroy, id: @diciplina
    end

    assert_redirected_to diciplinas_path
  end
end
