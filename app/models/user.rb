class User < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :email, :name, :password

  has_many :members

  scope :web, by_email

  scope :owners_for_project, lambda { |project|
    includes(:members).where(:members => {:role_id => Role.owner.id, :project_id => project.id})
  }

end
