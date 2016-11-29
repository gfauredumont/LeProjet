require "rails_helper"

RSpec.describe Project, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:project)).to be_valid
  end
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:owner) }

  it { should have_many(:tasks) }


  it "is not listed in published scope by default" do
    nb_public_projects = Project.published.all.size

    project = FactoryGirl.create(:project)

    expect(Project.published.all.size).to eq(nb_public_projects)
  end
  it "is listed in published scope when made public" do
    nb_public_projects = Project.published.all.size

    project = FactoryGirl.create(:project)

    project.update(is_public: true)
    expect(Project.published.all.size).to eq(nb_public_projects + 1)
  end
  it "is not listed in published scope when made not public again" do
    nb_public_projects = Project.published.all.size

    project = FactoryGirl.create(:project)

    project.update(is_public: true)
    expect(Project.published.all.size).to eq(nb_public_projects + 1)

    project.update(is_public: false)
    expect(Project.published.all.size).to eq(nb_public_projects)
  end

  it "is listed in project.mine for project creator" do
    user = FactoryGirl.create(:user)

    project = FactoryGirl.create(:project, owner: user)

    expect(Project.mine(user)).to include(project)
  end
  it "is not listed in project.mine for different user" do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project, owner: user)

    user2 = FactoryGirl.create(:user)

    expect(Project.mine(user2)).not_to include(project)
  end
  it "is not listed in project.mine for previous owner" do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project, owner: user)

    user2 = FactoryGirl.create(:user)
    project.update(owner: user2)

    expect(Project.mine(user)).not_to include(project)
    expect(Project.mine(user2)).to include(project)
  end


  it "is listed in project.mine for project creator" do
    user = FactoryGirl.create(:user)

    project = FactoryGirl.create(:project, owner: user)

    expect(Project.mine(user)).to include(project)
  end

end
