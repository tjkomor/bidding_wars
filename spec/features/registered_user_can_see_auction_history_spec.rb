require 'rails_helper'

RSpec.describe 'Registered user', type: :feature do
  create_category
  create_store
  create_roles
  create_items
  create_user

  feature 'auction history' do
    it 'it shows recent orders on dashboard' do
      user_one.roles << Role.first
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"
  
      expect(page).to have_content('Casino')
      expect(page).to have_content("30")
    end
  end
end
