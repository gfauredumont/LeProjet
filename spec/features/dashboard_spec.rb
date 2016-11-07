require 'rails_helper'

RSpec.feature 'DashboardDisplay', type: :feature do

  scenario 'When logged out, task creation isn\'t shown' do
    logout(:user)

    visit root_path

    expect(page).to_not have_submit_button("Create Task")
  end
  scenario 'When logged in, task creation is shown' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path

    expect(page).to have_submit_button("Create Task")

    logout(:user)
  end

  scenario 'When logged out, project creation buttons aren\'t shown' do
    logout(:user)

    visit root_path

    expect(page).to_not have_link(nil, href: '/projects/new')
  end
  scenario 'When logged in, project creation buttons are shown' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path

    expect(page).to have_link(nil, href: '/projects/new')

    logout(:user)
  end
end
