require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  feature 'admin' do
    it 'can log in and view dashboard page' do
      admin = User.create(username: 'admin', password: 'admin', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit login_path
    
      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'


      click_button 'Login'

      visit admin_dashboard_path

      assert page.has_content?("Admin Dashboard")
    end

    it 'cannot access admin dashboard as registered user' do
      user = User.create(username: 'rossedfort', password: 'password', role: 0)
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'cannot access admin dashboard as unregistered user' do
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
