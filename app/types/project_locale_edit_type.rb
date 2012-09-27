class ProjectLocaleEditType < ProjectLocale
  include BaseType

  attr_accessible :project_id, :locale_id
end