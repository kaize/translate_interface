class Member < ActiveRecord::Base
  attr_accessible :project_id, :role_id, :user_id
end
