class Key < ActiveRecord::Base
  attr_accessible :name, :project

  belongs_to :project

  has_many :translations
end
