FactoryGirl.define do
  sequence(:email) do |n|
    "adada#{n}@mail.com"
  end
end