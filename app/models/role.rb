class Role < ActiveRecord::Base
  include RolePrefetch
  include UsefullScopes

  #scope :web, by_name

  attr_accessible :name

  has_many :members

  scope :not_owner, where("name != 'owner'")
end
