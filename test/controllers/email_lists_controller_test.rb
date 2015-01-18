require 'test_helper'

class EmailListsControllerTest < ActionController::TestCase
  setup do
    @email_list = email_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_list" do
    assert_difference('EmailList.count') do
      post :create, email_list: { active: @email_list.active, email: @email_list.email, name: @email_list.name }
    end

    assert_redirected_to email_list_path(assigns(:email_list))
  end

  test "should show email_list" do
    get :show, id: @email_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_list
    assert_response :success
  end

  test "should update email_list" do
    patch :update, id: @email_list, email_list: { active: @email_list.active, email: @email_list.email, name: @email_list.name }
    assert_redirected_to email_list_path(assigns(:email_list))
  end

  test "should destroy email_list" do
    assert_difference('EmailList.count', -1) do
      delete :destroy, id: @email_list
    end

    assert_redirected_to email_lists_path
  end
end
