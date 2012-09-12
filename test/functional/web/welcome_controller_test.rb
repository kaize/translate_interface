require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  test "should get show" do
    sign_in(create(:user))
    get :index
    assert_response :success
  end

end
