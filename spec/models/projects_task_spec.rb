require "rails_helper"

RSpec.describe ProjectsTask, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:projects_task)).to be_valid
  end
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:task) }

  it { should belong_to(:project) }
  it { should belong_to(:task) }

end
