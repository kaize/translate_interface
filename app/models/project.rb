class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :project_locales
  has_many :keys
  has_many :members
end
