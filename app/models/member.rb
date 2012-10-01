class Member < ActiveRecord::Base
  include MemberRepository

  attr_accessible :project, :role, :user, :state

  belongs_to :project
  belongs_to :user
  belongs_to :role

  validates :user_id, :uniqueness => { :scope => [:project_id, :role_id] }

  has_many :translations

  state_machine :state, :initial => :unconfirmed do
    event :confirm do
      transition :unconfirmed => :active
    end

    event :block do
      transition :active => :blocked
    end

    event :unblock do
      transition :blocked => :active
    end
  end

  def self.participation_for user, project
    lookup = Member.where(:user_id => user).where(:project_id => project)

    if lookup.empty?
      nil
    else
      lookup.last.role
    end
  end
end
