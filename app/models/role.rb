class Role < ActiveRecord::Base
  include UsefullScopes

  #scope :web, by_name

  attr_accessible :name

  has_many :members

  scope :not_owner, where("name != 'owner'")

  def self.owner
    self.find_by_name :owner
  end

  def self.user
    self.find_by_name :user
  end

  def self.guest
    self.find_by_name :guest
  end
end
