class Locale < ActiveRecord::Base
  include UsefullScopes

  scope :web, by_name

  attr_accessible :name

  has_many :project_locales
end
