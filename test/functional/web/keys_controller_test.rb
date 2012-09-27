require 'test_helper'

class Web::KeysControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user
  end

  test "should get index" do
    key = create(:key)

    get :index
    assert_response :success
    assert_not_nil assigns(:keys)
  end

  test "should show key" do
    key = create(:key)
    get :show, id: key
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key" do
    key_attributes = attributes_for(:key)

    post :create, key_attributes

    assert_response :redirect

    key = Key.last

    assert_not_nil key
  end

  test "should destroy key" do
    key = create(:key)

    delete :destroy, id: key

    assert_response :redirect

    assert !Key.exists?(key)
  end

end
