FactoryGirl.define do

  factory :user, :class => UserEditType do
    password              "sekret"
    password_confirmation "sekret"
    name
    email
  end

  factory :user_no_confirmation, :parent => :user do
    email
    password_confirmation ""
  end

  factory :user_invalid_confirmation, :parent => :user do
    email
    password_confirmation "invalid"
  end

  factory :update_user, :parent => :user do
    email
    password "sicret"
    password_confirmation "sicret"
  end
end