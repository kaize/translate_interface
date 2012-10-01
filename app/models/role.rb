class Role < ActiveRecord::Base
  include AccessHelper
  include UsefullScopes

  #scope :web, by_name

  attr_accessible :name

  has_many :members

  scope :not_owner, where("name != 'owner'")

  singleton_class.class_eval do
    roles = Role.new.acl.roles

    roles.each do |r, _|
      role = Role.find_by_name(r)

      define_method r do
        role
      end
    end
  end
end
