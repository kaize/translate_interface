class RoleEditType < Role
  include BaseType

  validates :name, :uniqueness => true
end