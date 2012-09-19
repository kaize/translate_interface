class Project < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :name

  has_many :project_locales
  has_many :keys
  has_many :members

  scope :web, by_name
end
