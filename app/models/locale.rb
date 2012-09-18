class Locale < ActiveRecord::Base
  attr_accessible :name

  has_many :project_locales
end
