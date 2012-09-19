require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user

    @credentials = attributes_for :user
  end

  test "should log in" do
    post :create, user: @credentials

    assert_response :redirect
  end

end
