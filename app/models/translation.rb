class Translation < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :data, :key, :locale, :member

  belongs_to :key
  belongs_to :locale
  belongs_to :member

  # belongs_to :project, :through => :key

  def project
    key.project
  end

  state_machine :state, :initial => :unapproved do
    event :approve do
      transition :initial => :approved
    end

    event :reject do
      transition :initial => :rejected
    end
  end

end
