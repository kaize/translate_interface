class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :members

  scope :not_owner, where("name != 'owner'")

  def self.owner
    self.find_by_name :owner
  end
end
