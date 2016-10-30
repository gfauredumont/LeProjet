require 'rails_helper'

RSpec.feature "UserCreatesAProjects", type: :feature do

  scenario 'Project page is displayed' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit new_project_path

    project_name = Faker::Company.name
    fill_in 'Name', with: project_name
    fill_in 'Description', with: Faker::Company.catch_phrase

    click_button 'Create Project'

    expect(page).to have_content "#{project_name}"

    logout(:user)
  end
end
