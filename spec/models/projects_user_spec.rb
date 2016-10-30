require 'rails_helper'

RSpec.describe ProjectsUser, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:projects_user)).to be_valid
  end
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:user) }

  it "can be deleted without harming it's project" do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)

    project.add_member(user)
    project.remove_member(user)

    expect(project).to be_present
    expect(Project.find(project.id)).to be_present
  end

  it "list project in user when added as member" do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)

    project.add_member(user)
    expect(project.members).to include(user)
    expect(user.projects).to include(project)
  end
  it "not list project in user when removed as member" do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)

    project.add_member(user)
    project.remove_member(user)
    expect(project.members).to_not include(user)
    expect(user.projects).to_not include(project)
  end
end
