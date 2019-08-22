require 'test_helper'

class Dashboard::DummiesControllerTest < ActionController::TestCase
  setup do
    @dashboard_dummy = dashboard_dummies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dashboard_dummies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dashboard_dummy" do
    assert_difference('Dashboard::Dummy.count') do
      post :create, dashboard_dummy: { name: @dashboard_dummy.name }
    end

    assert_redirected_to dashboard_dummy_path(assigns(:dashboard_dummy))
  end

  test "should show dashboard_dummy" do
    get :show, id: @dashboard_dummy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dashboard_dummy
    assert_response :success
  end

  test "should update dashboard_dummy" do
    patch :update, id: @dashboard_dummy, dashboard_dummy: { name: @dashboard_dummy.name }
    assert_redirected_to dashboard_dummy_path(assigns(:dashboard_dummy))
  end

  test "should destroy dashboard_dummy" do
    assert_difference('Dashboard::Dummy.count', -1) do
      delete :destroy, id: @dashboard_dummy
    end

    assert_redirected_to dashboard_dummies_path
  end
end
