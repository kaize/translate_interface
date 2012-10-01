class Project < ActiveRecord::Base
  include ProjectRepository

  attr_accessible :name
  attr_accessor :creator

  has_many :project_locales
  has_many :keys
  has_many :members

  has_many :translations, :through => :keys

  def owner
    @owner ||= self.members.where(:role_id => Role.owner).last
  end

  def project
    self # for .project response in User.current_role_for
  end
end
