require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_admin
  create_user
  feature 'admin' do
    it 'cannot modify users account data' do
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
