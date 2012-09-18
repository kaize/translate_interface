class Translation < ActiveRecord::Base
  attr_accessible :data, :key_id, :locale_id, :member_id

  belongs_to :key
  belongs_to :locale
  belongs_to :member
end
