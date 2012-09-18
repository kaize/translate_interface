class Translation < ActiveRecord::Base
  attr_accessible :data, :key_id, :locale_id, :member_id
end
