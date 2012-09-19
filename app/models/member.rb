class Member < ActiveRecord::Base
  attr_accessible :project, :role, :user

  belongs_to :project
  belongs_to :user
  belongs_to :role

  validates :user_id, :uniqueness => { :scope => [:project_id, :role_id] }

  has_many :translations

  scope :owners, where(:role_id => Role.owner)
end
