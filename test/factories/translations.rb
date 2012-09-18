# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :translation do
    data "MyString"
    key_id 1
    locale_id 1
    member_id 1
  end
end
