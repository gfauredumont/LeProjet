FactoryGirl.define do
  factory :projects_task do
    association :project
    association :task
  end
end
