require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_store_admin
  create_user
  
  feature 'admin' do
    it 'cannot modify users account data' do
      skip
      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button "Login"

      expect(page).to have_content('Admin Dashboard')

      visit dashboard_path

      expect(page).to have_button("Edit Info")
      expect(page).to have_content("tyler")
    end
  end
end
