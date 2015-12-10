require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_store
  create_items
  create_roles
  create_user
  feature 'cannot see' do
    it 'info for deactivated store' do
      user_one.roles.clear << Role.where(name: 'user').first

      visit login_path

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'password'

      click_button "Login"

      visit store_path(store)
      save_and_open_page
      expect(page).to have_content("This page does not exist.")
    end
  end
end
