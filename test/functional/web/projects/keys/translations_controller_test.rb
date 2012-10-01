require 'test_helper'

class Web::Projects::Keys::TranslationsControllerTest < ActionController::TestCase
  setup do
    @project = create :project

    @key = @project.keys.first

    @translation = @key.translations.first

    member = @project.members.first

    @user = member.user
    sign_in @user
  end

  test "should get index" do
    get :index, project_id: @project, key_id: @key
    assert_response :success
  end

  test "should show translation" do
    get :show, id: @translation, project_id: @project, key_id: @key
    assert_response :success
  end

  test "should get new" do
    get :new, project_id: @project, key_id: @key
    assert_response :success
  end

  test "should create translation" do
    translation_attributes = attributes_for(:translation)

    post :create, project_id: @project, key_id: @key, translation: translation_attributes

    assert_response :redirect

    translation = Translation.last

    assert_not_nil translation
    
    assert_equal @user, translation.member.user
  end

  test "should destroy translation" do
    delete :destroy, id: @translation, project_id: @project, key_id: @key

    assert_response :redirect

    assert !Translation.exists?(@translation)
  end

end
