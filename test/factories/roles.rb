# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name "translator"
  end

  factory :owner, :class => RoleEditType do
    name "owner"
  end
end
