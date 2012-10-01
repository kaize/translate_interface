require 'test_helper'

class Web::Projects::MembersControllerTest < ActionController::TestCase
  setup do
    @project = create :project

    @member = @project.owner

    members = @project.members

    user = @member.user
    sign_in user
  end

  test "should get index" do
    get :index, project_id: @project
    assert_response :success
  end

  test "should show member" do
    get :show, project_id: @project, id: @member
    assert_response :success
  end

  test "should get new" do
    get :new, project_id: @project
    assert_response :success
  end

  test "should create member" do
    member_attributes = attributes_for(:member)

    assert_difference('Member.count') do
      post :create, project_id: @project, member: member_attributes

      assert_response :redirect
    end
  end
=begin
  test "should get edit" do
    get :edit, project_id: @project, id: @member
    assert_response :success
  end

  test "should update member" do
    role = Role.translator

    member_attributes = {:role_id => role.id}

    post :update, project_id: @project, id: @member, member: member_attributes

    assert_response :redirect

    member.reload

    assert_equal member_attributes[:role_id], member.role.id
  end
=end
  test "should destroy member" do
    member = @project.members.last

    delete :destroy, project_id: @project, id: member

    assert_response :redirect

    assert !Member.exists?(member)
  end

end
