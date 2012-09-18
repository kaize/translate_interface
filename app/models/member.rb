class Member < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :user_id

  belongs_to :project
  belongs_to :user
  belongs_to :role

  has_many :translations
end
