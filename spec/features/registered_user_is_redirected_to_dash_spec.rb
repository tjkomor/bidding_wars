require 'rails_helper'

RSpec.describe 'Registered user', type: :feature do
  create_user
  create_roles
  feature 'successful login' do
    it 'is redirected to dashboard' do
      user_one.roles.clear << Role.where(name: 'user').first
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      expect(page).to have_content("User Dashboard")
      expect(page).to_not have_content("Login")
    end
  end
end
