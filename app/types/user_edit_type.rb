class UserEditType < User
  include BaseType

  attr_accessible :password_confirmation

  has_secure_password

  validates :email, presence: true, uniqueness: true
end