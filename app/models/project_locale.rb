class ProjectLocale < ActiveRecord::Base
  attr_accessible :locale, :project

  belongs_to :locale
  belongs_to :project
end
