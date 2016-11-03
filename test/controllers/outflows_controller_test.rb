require 'test_helper'

class OutflowsControllerTest < ActionController::TestCase
  setup do
    @outflow = outflows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outflows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outflow" do
    assert_difference('Outflow.count') do
      post :create, outflow: { concepto: @outflow.concepto, entidad: @outflow.entidad, feha: @outflow.feha, nit: @outflow.nit, numero_factura: @outflow.numero_factura, valor: @outflow.valor }
    end

    assert_redirected_to outflow_path(assigns(:outflow))
  end

  test "should show outflow" do
    get :show, id: @outflow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outflow
    assert_response :success
  end

  test "should update outflow" do
    patch :update, id: @outflow, outflow: { concepto: @outflow.concepto, entidad: @outflow.entidad, feha: @outflow.feha, nit: @outflow.nit, numero_factura: @outflow.numero_factura, valor: @outflow.valor }
    assert_redirected_to outflow_path(assigns(:outflow))
  end

  test "should destroy outflow" do
    assert_difference('Outflow.count', -1) do
      delete :destroy, id: @outflow
    end

    assert_redirected_to outflows_path
  end
end
