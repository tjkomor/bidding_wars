require 'rails_helper'

RSpec.describe "Visitor" do
  feature 'Account' do
    create_store
    create_category
    # create_items

    it 'can put items in cart, create account, and view items after logging in' do
      skip
      visit root_path
      expect(page).to have_content("Login")
      expect(page).to have_content("Create Account")

      click_link "Create Account"

      expect(current_path).to eq(new_user_path)

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'
      fill_in 'First name', with: 'Ross'
      fill_in 'Last name', with: 'Edfort'
      fill_in 'Email address', with: 'email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      fill_in 'Image url', with: 'http://buddies.koinup.com/group-637.png'
      fill_in 'Bio', with: 'My name is Ross!'

      click_button "Create Account"

      expect(page).to have_content("Logged in as: rossedfort")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")

      click_link "Logout"

      visit root_path

      click_link "Login"

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'
      click_button "Login"

      click_button "Activate"

      # save_and_open_page
      expect(page).to have_content("My name is Ross!")
    end

    it "is not allowed to created account without username" do
      skip
      visit root_path
      click_link "Create Account"

      fill_in "Password", with: 'password'
      fill_in "First name", with: 'Ross'
      fill_in "Last name", with: 'Edfort'
      fill_in "Email address", with: 'fake@fake.com'
      fill_in "Phone number", with: '111-111-1111'
      click_button "Create Account"

      expect(page).to have_content("Username cannot be blank")
      expect(page).to_not have_content("Hello Ross!")
    end

    it "is not allowed to created account without password" do
      skip
      visit root_path
      click_link "Create Account"

      fill_in "Username", with: "rossedfort"
      fill_in "First name", with: 'Ross'
      fill_in "Last name", with: 'Edfort'
      fill_in "Email address", with: 'fake@fake.com'
      fill_in "Phone number", with: '111-111-1111'
      click_button "Create Account"

      expect(page).to have_content("Password cannot be blank")
      expect(page).to_not have_content("Hello Ross!")
    end

    it "is not allowed to created account without first name" do
      skip
      visit root_path
      click_link "Create Account"

      fill_in "Username", with: "rossedfort"
      fill_in "Password", with: 'password'
      fill_in "Last name", with: 'Edfort'
      fill_in "Email address", with: 'fake@fake.com'
      fill_in "Phone number", with: '111-111-1111'
      click_button "Create Account"

      expect(page).to have_content("First name cannot be blank")
      expect(page).to_not have_content("Hello Ross!")
    end

    it "is not allowed to created account without last name" do
      skip
      visit root_path
      click_link "Create Account"

      fill_in "Username", with: "rossedfort"
      fill_in "Password", with: 'password'
      fill_in "First name", with: 'Ross'
      fill_in "Email address", with: 'fake@fake.com'
      fill_in "Phone number", with: '111-111-1111'
      click_button "Create Account"

      expect(page).to have_content("Last name cannot be blank")
      expect(page).to_not have_content("Hello Ross!")
    end

    it "is not allowed to created account without email address" do
      skip
      visit root_path
      click_link "Create Account"

      fill_in "Username", with: "rossedfort"
      fill_in "Password", with: 'password'
      fill_in "First name", with: 'Ross'
      fill_in "Last name", with: 'Edfort'
      fill_in "Phone number", with: '111-111-1111'
      click_button "Create Account"

      expect(page).to have_content("Email address cannot be blank")
      expect(page).to_not have_content("Hello Ross!")
    end

    it "is not allowed to created account without phone number" do
      skip
      visit root_path
      click_link "Create Account"

      fill_in "Username", with: "rossedfort"
      fill_in "Password", with: 'password'
      fill_in "First name", with: 'Ross'
      fill_in "Last name", with: 'Edfort'
      fill_in "Email address", with: 'fake@fake.com'
      click_button "Create Account"

      expect(page).to have_content("Phone number cannot be blank")
      expect(page).to_not have_content("Hello Ross!")
    end
  end
end
