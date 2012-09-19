require 'test_helper'

class Web::ProjectsControllerTest < ActionController::TestCase
  setup do
    # side effect - for current_user usage
    user = create(:user)
    sign_in(user)

    @project_attributes = attributes_for(:project)
    @project = create(:project)
  end

  teardown do
    sign_out
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, @project_attributes

      assert_response :redirect
    end
  end

  test "current user must own the project created" do
    post :create, @project_attributes

    assert_equal current_user, Project.last.owner.user
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: @project_attributes

    assert_response :redirect
  end

  test "should destroy project" do
    @project = create(:project)

    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_response :redirect
  end

end