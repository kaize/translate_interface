class Locale < ActiveRecord::Base
  include LocaleRepository

  attr_accessible :name

  has_many :project_locales
end
