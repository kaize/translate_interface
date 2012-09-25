require 'test_helper'

class Web::LocalesControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user
  end

  test "should get index" do
    locale = create(:locale)

    get :index
    assert_response :success
    assert_not_nil assigns(:locales)
  end

  test "should show locale" do
    locale = create(:locale)
    get :show, id: locale
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locale" do
    locale_attributes = attributes_for(:locale)

    post :create, locale_attributes

    assert_response :redirect

    locale = Locale.last

    assert_not_nil locale
  end

  test "should destroy locale" do
    locale = create(:locale)

    delete :destroy, id: locale

    assert_response :redirect

    assert !Locale.exists?(locale)
  end

end
