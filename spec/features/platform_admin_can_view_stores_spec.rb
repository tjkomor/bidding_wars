require 'rails_helper'
RSpec.describe 'Platform Admin', type: :feature do
  feature 'can view' do
    create_roles
    create_user

    it 'individual stores' do
      platform_admin = User.create!(username: 'platformadmin', password: 'platformadmin', first_name: 'Clemson', last_name: 'Tigers', email_address: 'gotigers@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.where(name: 'platform_admin').first
      user_one.stores.create(name: "Lenny's", status: "Active")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(platform_admin)

      visit login_path

      fill_in 'Username', with: 'platformadmin'
      fill_in 'Password', with: 'platformadmin'

      click_button 'Login'

      visit platform_admin_dashboard_path

      assert page.has_content?("Platform Admin Dashboard")

      click_button "View Stores"

      expect(page).to have_link("Lenny's")

      click_link "Lenny's"

      expect(page).to have_content("Lenny's Admin Dashboard")
      expect(page).to have_content('Store Status: Active')
    end
  end
end
