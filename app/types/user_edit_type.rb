class UserEditType < User
  include BaseType

  attr_accessible :password, :password_confirmation

  has_secure_password

  validates :name, presence: true, uniqueness: true
end