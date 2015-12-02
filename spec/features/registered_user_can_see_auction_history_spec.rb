require 'rails_helper'

RSpec.describe 'Registered user', type: :feature do
  create_user
  create_order
  feature 'auction history' do
    it 'it shows recent orders on dashboard' do
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      expect(page).to have_content('190')
      expect(page).to have_content("Completed")
    end
  end
end