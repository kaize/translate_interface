class User < ActiveRecord::Base
  include UserRepository

  attr_accessible :email, :name, :password

  attr_reader :admin

  has_many :members
  has_many :projects, :through => :members

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
