class Key < ActiveRecord::Base
  include KeyRepository

  attr_accessible :name, :project

  belongs_to :project

  has_many :translations
end
