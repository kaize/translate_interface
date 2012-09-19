class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :members

  def self.owner
    Role.find_by_name :owner
  end
end
