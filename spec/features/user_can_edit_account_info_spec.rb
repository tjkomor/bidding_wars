require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  feature "Account" do
    it "can edit account information" do
      create_rental_items
      login_user
      visit dashboard_path
      click_link "Edit"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: 'NewUsername'
      fill_in 'Password', with: 'newpassword'
      fill_in 'First name', with: 'New First Name'
      fill_in 'Last name', with: 'New Last Name'
      fill_in 'Email address', with: 'new_email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      click_button 'Update'

      # expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("User Updated!")
      expect(page).to have_content("Hello New First Name!")
    end
  end
end
