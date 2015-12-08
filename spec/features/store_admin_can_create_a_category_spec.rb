require 'rails_helper'

RSpec.describe "Admin", type: :feature do
  create_category
  create_items
  create_user

  feature "can create" do
    xit "a category" do
      create_rental_items
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

    xit "cannot create a category with no name" do
      create_rental_items
      visit login_path

      fill_in "Username", with: "admin"
      fill_in "Password", with: "admin"
      click_button "Login"
      click_button "New Category"
      expect(current_path).to eq(new_admin_category_path)
      fill_in "Name", with: ""
      click_button "Create Category"
      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Name cannot be blank")
    end
  end
end
