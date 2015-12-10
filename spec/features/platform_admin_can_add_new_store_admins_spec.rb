require 'rails_helper'
RSpec.describe 'Admin', type: :feature do

  feature 'can' do
    create_category
    create_store
    create_items
    create_roles

    it 'add admins' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      platform_admin = User.create(username: 'platform_admin', password: 'platform_admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.all

      visit login_path

      fill_in "Username", with: 'platform_admin'
      fill_in "Password", with: 'platform_admin'

      click_button "Login"

      click_button "View Stores"

      within("#store-#{store.id}") do
        expect(page).to have_content("Pending")
        click_button "Activate"
      end

      expect(current_path).to eq(platform_admin_store_path(store))

      click_button 'Add New Administrator'

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'
      fill_in 'First name', with: 'Ross'
      fill_in 'Last name', with: 'Edfort'
      fill_in 'Email address', with: 'email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      fill_in 'Bio', with: 'This is my store, too'

      click_button "Create Account"

      expect(current_path).to eq(platform_admin_store_path(store))

      click_link 'Logout'

      visit login_path

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'

      click_button 'Login'

      expect(current_path).to eq(admin_dashboard_path)
      within("#title") do
        expect(page).to have_content("Lenny's")
      end
    end
  end
end
