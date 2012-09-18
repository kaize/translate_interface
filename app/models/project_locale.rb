class ProjectLocale < ActiveRecord::Base
  attr_accessible :locale_id, :project_id

  belongs_to :locale
  belongs_to :project
end
