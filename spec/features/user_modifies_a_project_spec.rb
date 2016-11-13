require 'rails_helper'

RSpec.feature "UserModifiesAProjects", type: :feature do

  scenario 'Owned project edit page is available' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    project = FactoryGirl.create(:project, owner: user)

    visit edit_project_path(project)

    expect(current_path).to eq edit_project_path(project)

    logout(:user)
  end

  scenario 'Not owned project edit page is not available' do
    project = FactoryGirl.create(:project)

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit edit_project_path(project)

    expect(current_path).not_to eq edit_project_path(project)

    logout(:user)
  end
end
