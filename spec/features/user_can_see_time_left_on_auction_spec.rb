require 'rails_helper'
RSpec.describe 'User', type: :feature do
  create_category
  create_store
  create_user
  create_items
  create_roles
  feature 'sees' do
    xit 'time left on auction' do
      user_one.roles.clear << Role.where(name: 'user').first
      visit login_path

      fill_in 'Username', with: 'rossedfort'
      fill_in 'Password', with: 'password'

      click_button "Login"

      visit "/items/#{item_one.id}"

      expect(page).to have_content()
    end
  end
end
