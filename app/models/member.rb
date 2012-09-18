class Member < ActiveRecord::Base
  attr_accessible :project, :role, :user

  belongs_to :project
  belongs_to :user
  belongs_to :role

  has_many :translations
end
