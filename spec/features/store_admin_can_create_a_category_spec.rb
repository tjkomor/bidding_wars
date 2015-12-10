require 'rails_helper'

RSpec.describe "Admin", type: :feature do
  create_category
  create_store
  create_roles
  create_store_admin
  create_items
  create_user

  feature "can create" do
    it "a category" do
      admin_one.roles << Role.where(name: 'store_admin').first
      admin_one.stores.create(name: "Lenny's")
      visit login_path

      fill_in "Username", with: "admin"
      fill_in "Password", with: "admin"
      click_button "Login"

      click_button "New Category"

      expect(current_path).to eq(new_admin_category_path)

      fill_in "Name", with: "Bags"

      click_button "Create Category"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("New Category Created!")
      expect(page).to have_content("Bags")
    end

    it "cannot create a category with no name" do
      admin_one.roles << Role.where(name: 'store_admin').first
      admin_one.stores.create(name: "Lenny's")
      visit login_path

      fill_in "Username", with: "admin"
      fill_in "Password", with: "admin"
      click_button "Login"

      click_button "New Category"

      fill_in "Name", with: ""

      click_button "Create Category"
      
      expect(page).to have_content("Name cannot be blank")
    end
  end
end
