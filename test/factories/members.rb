# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :translator do
    user
    role
    project
  end
end
