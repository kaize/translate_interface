class Translation < ActiveRecord::Base
  attr_accessible :data, :key, :locale, :member

  belongs_to :key
  belongs_to :locale
  belongs_to :member
end
