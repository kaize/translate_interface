# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name

    after :create do |p|
      with_options :project => p do |f|
        f.create :key
        f.create :project_locale
        f.create :member, :role => Role.owner
      end
    end
  end
end
