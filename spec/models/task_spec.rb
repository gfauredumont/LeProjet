require "rails_helper"

RSpec.describe Task, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:task)).to be_valid
  end
  it { expect validate_presence_of(:name) }

  it { expect have_many(:projects) }

  it "is unassigned when freshly created" do
    task = FactoryGirl.create(:task)

    expect(Task.unassigned).to include(task)
    # Task.unassigned.should include(task)
  end
  it "is NOT unassigned when added to a project" do
    project = FactoryGirl.create(:project)

    task = FactoryGirl.create(:task)
    task.projects << project

    expect(Task.unassigned).to_not include(task)
    # Task.unassigned.should_not include(task)
  end
end
