module UserRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :web, ->{by_email}

    scope :owners_for_project, lambda { |project|
      includes(:members).where(:members => {:role_id => Role.owner.id, :project_id => project.id})
    }
  end
end