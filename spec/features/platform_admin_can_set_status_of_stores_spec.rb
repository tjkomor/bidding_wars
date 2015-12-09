require 'rails_helper'

RSpec.describe "Platform Admin", type: :feature do
  create_category
  create_store
  create_items
  create_user
  create_order
  create_roles

  feature "sets status" do
    it "of new stores" do
      platform_admin = User.create(username: 'platform_admin', password: 'platform_admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.where(name: 'platform_admin').first
      user_one.stores.create(name: "Tyler", status: false)
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

      expect(page).to have_content("#{store.name}")
      expect(page).to have_content("Deactivate")
      expect(page).to have_content('John Smith')
      expect(page).to have_content('Phone Number: 555-234-5678')
      expect(page).to have_content('Email: johnsmith@gmail.com')
      expect(page).to have_content('Joined on: December 08, 2015')
    end
  end
end
