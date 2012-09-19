class Project < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :name
  attr_accessor :creator

  has_many :project_locales
  has_many :keys
  has_many :members

  scope :web, by_name

  def owner
    @owner ||= User.owners_for_project(self).last
  end
end
