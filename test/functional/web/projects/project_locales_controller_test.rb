require 'test_helper'

class Web::Projects::ProjectLocalesControllerTest < ActionController::TestCase
  setup do
    @project = create :project

    @project_locale = @project.project_locales.first

    member = @project.owner

    user = member.user
    sign_in user
  end

  test "should get index" do
    get :index, project_id: @project
    assert_response :success
  end

  test "should show project_locale" do
    get :show, project_id: @project, id: @project_locale
    assert_response :success
  end

  test "should get new" do
    get :new, project_id: @project
    assert_response :success
  end

  test "should create project_locale" do
    project_locale_attributes = attributes_for(:project_locale)

    post :create, project_id: @project, project_locale: project_locale_attributes

    assert_response :redirect

    project_locale = ProjectLocale.last

    assert_not_nil project_locale
  end

=begin
  test "should get edit" do
    project_locale = create :project_locale
    get :edit, id: project_locale
    assert_response :success
  end

  test "should update project_locale" do
    project_locale = create :project_locale

    project = create :project

    project_locale_attributes = {:project_id => project}

    post :update, id: project_locale, project_locale: project_locale_attributes

    assert_response :redirect

    project_locale.reload

    assert_equal project.id, project_locale.project.id
  end
=end

  test "should destroy project_locale" do
    delete :destroy, project_id: @project, id: @project_locale

    assert_response :redirect

    assert !ProjectLocale.exists?(@project_locale)
  end

end
