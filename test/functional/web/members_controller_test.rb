require 'test_helper'

class Web::MembersControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user
  end

  test "should get index" do
    member = create(:member)
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should show member" do
    member = create(:member)
    get :show, id: member
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    member_attributes = attributes_for(:member)

    post :create, member_attributes

    assert_response :redirect

    member = MemberEditType.last

    assert_not_nil member
  end

  test "should get edit" do
    member = create :member
    get :edit, id: member
    assert_response :success
  end

  test "should update member" do
    member = create :member

    role = Role.find_by_name("translator")

    member_attributes = {:role_id => role.id}

    post :update, id: member, member: member_attributes

    assert_response :redirect

    member.reload

    assert_equal member_attributes[:role_id], member.role.id
  end

  test "should destroy member" do
    member = create(:member)

    delete :destroy, id: member

    assert_response :redirect

    assert !Member.exists?(member)
  end

end
