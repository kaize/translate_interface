require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: attributes_for(:user)

      assert_response :success

      print "#{attributes_for(:user)}"
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    @user = create(:user)

    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    @user = create(:user)

    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    @user = create(:user)

    put :update, id: @user, user: attributes_for(:update_user)
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    @user = create(:user)

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should fail changing if password not confirmed" do
    @user = create(:user)

    put :update, id: @user, user: attributes_for(:user_no_confirmation)
    assert_response :falture
  end
end
