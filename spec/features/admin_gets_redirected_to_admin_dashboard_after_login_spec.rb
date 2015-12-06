require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  # create_admin
  
  feature "login" do
    it 'is redirected to admin dashboard after logging in' do
      skip
      visit login_path
      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
    end
  end
end
