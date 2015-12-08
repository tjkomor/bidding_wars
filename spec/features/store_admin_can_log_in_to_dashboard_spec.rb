require 'rails_helper'
RSpec.describe 'store admin', type: :feature do
  feature 'can login' do
    create_roles
    it 'and view dashboard page' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)
      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      visit admin_dashboard_path

      assert page.has_content?("Admin Dashboard")
    end

    it 'cannot access admin dashboard as registered user' do
      user = User.new(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024')
      user.save
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'cannot access admin dashboard as unregistered user' do
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
