require 'rails_helper'

RSpec.describe "Platform Admin", type: :feature do
  create_category
  create_store
  create_items
  create_user
  create_order
  create_roles

  feature "creates" do
    it "new categories" do
      platform_admin = User.create(username: 'platform_admin', password: 'platform_admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.where(name: 'platform_admin').first

      visit login_path

      fill_in "Username", with: 'platform_admin'
      fill_in "Password", with: 'platform_admin'

      click_button "Login"

      expect(page).to have_content("Platform Admin Dashboard")
      expect(page).to_not have_content("Login")

      click_button "Create New Category"

      fill_in "Name", with: "Furniture"

      click_button "Create Category"

      click_link "Shop Categories"

      within ('#dropdown1') do
        expect(page).to have_content("Furniture")
      end
    end
  end
end
