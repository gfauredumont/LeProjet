FactoryGirl.define do
  factory :task do
    name { Faker::Hipster.sentence(4) }
    description { Faker::Company.catch_phrase }
    task_type "42or51"
  end
end
