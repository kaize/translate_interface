class User < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :email, :name, :password

  attr_reader :admin

  has_many :members
  has_many :projects, :through => :members

  scope :web, by_email

  scope :owners_for_project, lambda { |project|
    includes(:members).where(:members => {:role_id => Role.owner.id, :project_id => project.id})
  }

  def roles_for object

    superaccess = self.admin? ? Role.admin : Role.user

    per_project = if object.respond_to? :project
      project = object.project
      participation = Member.participation_for self, project
      participation || Role.user
    else
      Role.user
    end

    [superaccess, per_project].collect do |role|
      role.name
    end
  end
end
