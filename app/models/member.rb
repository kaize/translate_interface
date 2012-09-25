class Member < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :project, :role, :user

  belongs_to :project
  belongs_to :user
  belongs_to :role

  validates :user_id, :uniqueness => { :scope => [:project_id, :role_id] }

  has_many :translations

  scope :owners, where(:role_id => Role.owner)

  scope :owner_for, lambda {|project| owners.where :project_id => project}

  def self.participation_for user, project
    lookup = Member.where(:user_id => user).where(:project_id => project)

    if lookup.empty?
      nil
    else
      lookup.last
    end
  end
end
