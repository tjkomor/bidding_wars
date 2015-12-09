require 'rails_helper'

RSpec.describe "Platform Admin", type: :feature do
  create_category
  create_store
  create_items
  create_user
  # create_order
  create_platform_admin

  feature "creates" do
    xit "new categories" do
      create_bid_items
      visit login_path

      fill_in "Username", with: 'platform_admin'
      fill_in "Password", with: 'platfrom_admin'

      click_button "Login"

      expect(page).to have_content("My Dashboard")
      expect(page).to_not have_content("Login")

      click_button "Create new category"

      fill_in "Name", with: "Furniture"

      click_button "Create!"

      click_link "Shop Categories"

      within ('#dropdown1') do
        expect(page).to have_content("Furniture")
      end
    end
  end
end
