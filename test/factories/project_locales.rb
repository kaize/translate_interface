# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_locale do
    locale
    project
  end
end
