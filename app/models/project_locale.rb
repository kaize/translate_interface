class ProjectLocale < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :locale, :project

  belongs_to :locale
  belongs_to :project
end
