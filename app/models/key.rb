class Key < ActiveRecord::Base
  attr_accessible :name, :project_id

  belongs_to :project

  has_many :translations
end
