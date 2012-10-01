module MemberRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :owners, ->{where(:role_id => Role.owner)}
    scope :owner_for, lambda {|project| owners.where :project_id => project}
  end
end