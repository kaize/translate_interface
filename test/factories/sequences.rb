FactoryGirl.define do
  sequence(:email) do |n|
    "test_#{n}@mail.com"
  end

  sequence(:name) do |n|
    "test_#{n}"
  end
end