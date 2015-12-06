require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_store
  create_items
  create_user

  feature "Account" do
    it "can edit account information" do

      login_user
      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: 'NewUsername'
      fill_in 'Password', with: 'newpassword'
      fill_in 'First name', with: 'New First Name'
      fill_in 'Last name', with: 'New Last Name'
      fill_in 'Email address', with: 'new_email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      click_button 'Update'

      expect(page).to have_content("User Updated!")
      expect(page).to have_content("New First Name")
    end

    it "gets an error when password is left out" do

      login_user
      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: 'NewUsername'
      fill_in 'First name', with: 'New First Name'
      fill_in 'Last name', with: 'New Last Name'
      fill_in 'Email address', with: 'new_email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      click_button 'Update'

      expect(page).to have_content("Password cannot be blank")
      expect(page).to_not have_content("New First Name")
    end

    it "gets an error when username is left out" do

      login_user
      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: ''
      fill_in 'Password', with: 'newpassword'
      fill_in 'First name', with: 'New First Name'
      fill_in 'Last name', with: 'New Last Name'
      fill_in 'Email address', with: 'new_email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      click_button 'Update'

      expect(page).to have_content("Username cannot be blank")
      expect(page).to_not have_content("New First Name")
    end

    it "gets an error when first name is left out" do

      login_user
      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: 'NewUsername'
      fill_in 'Password', with: 'newpassword'
      fill_in 'First name', with: ''
      fill_in 'Last name', with: 'New Last Name'
      fill_in 'Email address', with: 'new_email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      click_button 'Update'

      expect(page).to have_content("First name cannot be blank")
      expect(page).to_not have_content("New First Name")
    end

    it "gets an error when last name is left out" do

      login_user
      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: 'NewUsername'
      fill_in 'Password', with: 'newpassword'
      fill_in 'First name', with: 'New First Name'
      fill_in 'Last name', with: ''
      fill_in 'Email address', with: 'new_email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      click_button 'Update'

      expect(page).to have_content("Last name cannot be blank")
      expect(page).to_not have_content("New First Name")
    end

    it "gets an error when email address is left out" do

      login_user
      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: 'NewUsername'
      fill_in 'Password', with: 'newpassword'
      fill_in 'First name', with: 'New First Name'
      fill_in 'Last name', with: 'New Last Name'
      fill_in 'Email address', with: ''
      fill_in 'Phone number', with: '101-101-1001'
      click_button 'Update'

      expect(page).to have_content("Email address cannot be blank")
      expect(page).to_not have_content("New First Name")
    end

    it "gets an error when email address is left out" do

      login_user
      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(user_one))

      fill_in 'Username', with: 'NewUsername'
      fill_in 'Password', with: 'newpassword'
      fill_in 'First name', with: 'New First Name'
      fill_in 'Last name', with: 'New Last Name'
      fill_in 'Email address', with: 'example@example.com'
      fill_in 'Phone number', with: ''
      click_button 'Update'

      expect(page).to have_content("Phone number cannot be blank")
      expect(page).to_not have_content("New First Name")
    end

    it "can delete account", js: true do
      skip
      login_user

      click_link "Delete Account"
      sleep(1)
      click_on "Yes"

      expect(page).to have_content("Login")
      expect(page).to have_content("Your account has been deactivated")
      expect(current_path).to eq(root_path)
    end
  end
end
