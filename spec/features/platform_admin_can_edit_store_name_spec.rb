require 'rails_helper'
RSpec.describe 'Platform', type: :feature do

  feature 'can' do

    create_category
    create_store
    create_items
    create_roles
    create_store_admin
    create_order

    it 'edit store name' do
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

      click_button "Edit Store Info"

      fill_in "Name", with: "New Name"
      click_button "Edit"

      expect(page).to have_content("New Name Admin Dashboard")
    end
  end
end
