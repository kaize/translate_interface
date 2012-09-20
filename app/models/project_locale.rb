class ProjectLocale < ActiveRecord::Base
  include UsefullScopes

  scope :web, all

  attr_accessible :locale, :project

  belongs_to :locale
  belongs_to :project
end
