require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  user = create_user
  feature 'admin' do
    it 'can log in and view dashboard page' do
      admin = User.create(username: 'admin', password: 'admin', role: 1)
      visit root_path
      click_link "Login"

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'


      click_button 'Login'

      visit admin_dashboard_path
      
      assert page.has_content?("Admin Dashboard")
    end

    it 'cannot access admin dashboard as registered user' do
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'cannot access admin dashboard as unregistered user' do
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
