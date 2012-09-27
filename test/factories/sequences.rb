FactoryGirl.define do
  sequence(:email) do |n|
    "test_#{n}@mail.com"
  end
end