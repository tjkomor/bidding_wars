require 'rails_helper'

RSpec.describe "Logged in User", type: :feature do
  create_category
  create_store
  create_items
  create_user
  feature "Edit" do
    it "edits profile attributes from dashboard" do
      login_user
      visit '/dashboard'

      expect(user_one.first_name).to_be "Ross"

      click_button "Edit Profile"

      fill_in "First name", with: "Rick"
      fill_in "Bio", with: "This is my new bio."

      click_button "Edit"

      expect(user_one.first_name).to_be "Rick"
      expect(page).to have_content("Rick")
      expect(page).to have_content("This is my new bio.")
    end
  end
end
