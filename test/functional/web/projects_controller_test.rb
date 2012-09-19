require 'test_helper'

class Web::ProjectsControllerTest < ActionController::TestCase
  setup do
    # side effect - for current_user usage
    user = create(:user)
    sign_in(user)

    create(:role, name: "owner")
  end

  test "should get index" do
    project = create(:project)
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should show project" do
    project = create(:project)
    get :show, id: project
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    project_attributes = attributes_for(:project)

    post :create, project_attributes

    assert_response :redirect

    project = Project.last

    assert_not_nil project
  end

  test "current user must own the project created" do
    user = current_user
    distinctive_name = "the other project"
    project_attributes = attributes_for(:project, name: distinctive_name)

    post :create, project: project_attributes

    project = Project.last

    assert_equal distinctive_name, project.name
    assert_equal user, project.owner
  end

  test "should get edit" do
    project = create :project
    get :edit, id: project
    assert_response :success
  end

  test "should update project" do
    project = create :project
    project_attributes = {name: "new name"}

    put :update, id: project, project: project_attributes

    assert_response :redirect
    assert_equal "new name", Project.last.name
  end

  test "should destroy project" do
    project = create(:project)

    delete :destroy, id: project

    assert_response :redirect

    assert Project.find_by_name(project.name).nil?
  end

end
