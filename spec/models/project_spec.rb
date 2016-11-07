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

end
