FactoryGirl.define do
  #sequence(:random_pass) { |n| LoremIpsum.generate }

  factory :user, :class => UserEditType do
    password              "sekret"
    password_confirmation "sekret"
    email                 { generate(:random_email) }
  end

  factory :user_no_confirmation, :parent => :user do
    email { generate(:random_email) }
    password_confirmation ""
  end

  factory :user_invalid_confirmation, :parent => :user do
    email { generate(:random_email) }
    password_confirmation "invalid"
  end

  factory :update_user, :parent => :user do
    email { generate(:random_email) }
    password "sicret"
    password_confirmation "sicret"
  end
end