# As a visitor
#     When I visit "/"
#     Then I should see a link for "Login"
#     And when I click link "Create Account"
#     Then my current page should be "/dashboard"
#     And I should see a message in the navbar that says "Logged in as SOME_USER"
#     And I should see my profile information
#     And I should not see a link for "Login"
#     And I should see a link for "Logout"
require 'rails_helper'

RSpec.describe "visitor can create account" do
  feature 'create account' do
    create_brand
    create_category
    create_items
    it 'can create an account' do
      add_item_to_cart
      visit root_path
      expect(page).to have_content("Login")
      expect(page).to have_content("Create Account")

      click_link "Create Account"

      expect(current_path).to eq(new_user_path)

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'

      click_button "Create Account"

      expect(page).to have_content("Logged in as: rossedfort")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")

      visit cart_path

      expect(page).to have_content(item_one.name)

      click_link "Logout"

      expect(page).to have_content("Login")
      expect(page).to_not have_content("Logout")

    end
  end
end
