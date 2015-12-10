require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_store
  create_items
  create_roles
  create_user
  create_store_admin

  feature "Account" do

    it "can edit account information" do
      admin_one.roles.clear << Role.where(name: 'store_admin').first
      user_one.roles.clear << Role.where(name: 'user').first

      login_store_admin

      visit dashboard_path

      click_link_or_button "Edit Info"

      expect(current_path).to eq(edit_user_path(admin_one))

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
      user_one.roles.clear << Role.where(name: 'user').first
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
      user_one.roles.clear << Role.where(name: 'user').first
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
      user_one.roles.clear << Role.where(name: 'user').first
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
      user_one.roles.clear << Role.where(name: 'user').first
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
      user_one.roles.clear << Role.where(name: 'user').first
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
      user_one.roles.clear << Role.where(name: 'user').first
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
  end
end
