class MemberEditType < Member
  include BaseType

  attr_accessible :project_id, :role_id, :user_id
end