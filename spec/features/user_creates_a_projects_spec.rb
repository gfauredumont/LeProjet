require 'rails_helper'

RSpec.feature "UserCreatesAProjects", type: :feature do

  scenario 'Project page is displayed' do
    visit new_project_path

    project_name = Faker::Company.name
    fill_in 'Name', with: project_name
    fill_in 'Description', with: Faker::Company.catch_phrase

    click_button 'Create Project'

    expect(page).to have_content "#{project_name}"
  end
end
