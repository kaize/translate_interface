class Translation < ActiveRecord::Base
  include UsefullScopes

  scope :web, all

  attr_accessible :data, :key, :locale, :member

  belongs_to :key
  belongs_to :locale
  belongs_to :member
end
