# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :translation do
    data "test translaton"
    key
    locale
    member
  end
end
