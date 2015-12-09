require 'rails_helper'

RSpec.describe "Platform Admin", type: :feature do
  create_category
  create_store
  create_items
  create_store_admin
  create_order
  create_roles

  feature "sets status" do
    it "of new stores" do
      platform_admin = User.create(username: 'platform_admin', password: 'platform_admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.where(name: 'platform_admin').first
      admin_one.roles.clear << Role.where(name: 'store_admin').first
      new_store = admin_one.stores.create(name: "Tyler")

      visit login_path

      fill_in "Username", with: 'platform_admin'
      fill_in "Password", with: 'platform_admin'

      click_button "Login"

      expect(page).to have_content("Platform Admin Dashboard")
      expect(page).to_not have_content("Login")

      click_button "View Stores"

      within("#store-#{new_store.id}") do
        expect(page).to have_content("Pending")
        click_button "Activate"
      end

      expect(page).to have_content("Active")
    end
  end
end
