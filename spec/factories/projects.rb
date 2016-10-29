FactoryGirl.define do
  factory :project do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }

    owner
  end
end
