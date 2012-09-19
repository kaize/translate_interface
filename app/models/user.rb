class User < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :email, :name, :password

  has_many :members

  scope :web, by_email
end
