require 'rails_helper'

RSpec.describe "Platform Admin", type: :feature do
  create_category
  create_store
  create_items
  create_user
  # create_order
  # create_platform_admin

  feature "views" do
    it "all orders from all businesses" do
      skip
      create_bid_items
      visit login_path

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      expect(page).to have_content("My Dashboard")
      expect(page).to_not have_content("Login")

      click_link "Lenny's"

      expect(page).to have_content("Atari")
      expect(page).to have_content("Casino")
    end

    it "all orders from all businesses" do
      skip
      create_bid_items
      visit login_path

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      expect(page).to have_content("My Dashboard")
      expect(page).to_not have_content("Login")

      click_link "All Orders"

      expect(page).to have_content("Atari")
      expect(page).to have_content("Casino")
    end
  end
end
