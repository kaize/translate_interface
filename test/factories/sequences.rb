FactoryGirl.define do
  sequence(:random_email) do |n|
    "adada#{n}@mail.com"
  end
end