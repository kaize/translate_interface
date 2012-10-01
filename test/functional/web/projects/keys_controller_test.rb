require 'test_helper'

class Web::Projects::KeysControllerTest < ActionController::TestCase
  setup do
    @project = create :project

    member = @project.members.first

    @user = member.user
    sign_in @user
  end

  test "should get index" do
    get :index, project_id: @project
    assert_response :success
  end

  test "should show key" do
    get :show, project_id: @project, id: @project.keys.first
    assert_response :success
  end

  test "should get new" do
    get :new, project_id: @project
    assert_response :success
  end

  test "should create key" do
    key_attributes = attributes_for(:key)

    post :create, project_id: @project, key: key_attributes

    assert_response :redirect

    key = Key.last

    assert_equal key_attributes[:name], key.name
  end

  test "should destroy key" do
    key = @project.keys.first

    delete :destroy, project_id: @project, id: key

    assert_response :redirect

    assert !Key.exists?(key)
  end

end
