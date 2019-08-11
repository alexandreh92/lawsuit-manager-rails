require 'test_helper'

class LawsuitsControllerTest < ActionController::TestCase
  setup do
    @lawsuit = lawsuits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lawsuits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lawsuit" do
    assert_difference('Lawsuit.count') do
      post :create, lawsuit: { active_id: @lawsuit.active_id, autos: @lawsuit.autos, conciliation_date: @lawsuit.conciliation_date, fees: @lawsuit.fees, forum_id: @lawsuit.forum_id, instruction_date: @lawsuit.instruction_date, lawyer_id: @lawsuit.lawyer_id, passive_id: @lawsuit.passive_id }
    end

    assert_redirected_to lawsuit_path(assigns(:lawsuit))
  end

  test "should show lawsuit" do
    get :show, id: @lawsuit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lawsuit
    assert_response :success
  end

  test "should update lawsuit" do
    patch :update, id: @lawsuit, lawsuit: { active_id: @lawsuit.active_id, autos: @lawsuit.autos, conciliation_date: @lawsuit.conciliation_date, fees: @lawsuit.fees, forum_id: @lawsuit.forum_id, instruction_date: @lawsuit.instruction_date, lawyer_id: @lawsuit.lawyer_id, passive_id: @lawsuit.passive_id }
    assert_redirected_to lawsuit_path(assigns(:lawsuit))
  end

  test "should destroy lawsuit" do
    assert_difference('Lawsuit.count', -1) do
      delete :destroy, id: @lawsuit
    end

    assert_redirected_to lawsuits_path
  end
end
