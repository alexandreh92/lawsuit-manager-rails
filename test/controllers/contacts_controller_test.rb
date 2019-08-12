require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { address: @contact.address, birthdate: @contact.birthdate, city: @contact.city, cpf: @contact.cpf, district: @contact.district, lastname: @contact.lastname, lawyer_id: @contact.lawyer_id, marital_status_id: @contact.marital_status_id, name: @contact.name, number: @contact.number, profession_id: @contact.profession_id, rg: @contact.rg, state: @contact.state, zipcode: @contact.zipcode }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { address: @contact.address, birthdate: @contact.birthdate, city: @contact.city, cpf: @contact.cpf, district: @contact.district, lastname: @contact.lastname, lawyer_id: @contact.lawyer_id, marital_status_id: @contact.marital_status_id, name: @contact.name, number: @contact.number, profession_id: @contact.profession_id, rg: @contact.rg, state: @contact.state, zipcode: @contact.zipcode }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
