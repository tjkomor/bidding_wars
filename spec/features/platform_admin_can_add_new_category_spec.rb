require 'rails_helper'

RSpec.describe "Platform", type: :feature do
  create_category
  create_store
  create_items
  create_roles
  create_store_admin
  create_order

  feature "can create" do
    it "a category" do

      platform_admin = User.create(username: 'platform_admin', password: 'platform_admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.all

      visit login_path

      fill_in "Username", with: 'platform_admin'
      fill_in "Password", with: 'platform_admin'

      click_button "Login"

      click_button("Create New Category")

      fill_in "Name", with: "Bags"
      click_button "Create Category"

      expect(current_path).to eq(platform_admin_dashboard_path)
      expect(page).to have_content("New Category Created!")
      expect(page).to have_content("Bags")
    end
  end
end
