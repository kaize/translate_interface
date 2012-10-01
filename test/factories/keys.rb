# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :key do
    name "MyString"

    after :create do |k|
      create :translation, :key => k
    end
  end
end
