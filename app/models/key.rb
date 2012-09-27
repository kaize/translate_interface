class Key < ActiveRecord::Base
  include UsefullScopes

  scope :web, by_name

  attr_accessible :name, :project

  belongs_to :project

  has_many :translations
end
