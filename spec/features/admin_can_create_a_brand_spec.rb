require 'rails_helper'

RSpec.describe "Admin", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature "Brand" do
    it "can create a brand" do
      create_rental_items
      visit login_path

      fill_in "Username", with: "admin"
      fill_in "Password", with: "admin"
      click_button "Login"
      click_button "New Brand"
      expect(current_path).to eq(new_admin_brand_path)
      fill_in "Name", with: "Nikon"
      click_button "Create Brand"
      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("New Brand Created!")
      expect(page).to have_content("Nikon")
    end

    it "cannot create a brand with no name" do
      create_rental_items
      visit login_path

      fill_in "Username", with: "admin"
      fill_in "Password", with: "admin"
      click_button "Login"
      click_button "New Brand"
      expect(current_path).to eq(new_admin_brand_path)
      fill_in "Name", with: ""
      click_button "Create Brand"
      expect(current_path).to eq(admin_brands_path)
      expect(page).to have_content("Name can't be blank")
    end
  end
end
