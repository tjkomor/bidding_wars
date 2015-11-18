require 'rails_helper'

RSpec.describe "Visitor" do
  feature 'Account' do
    create_brand
    create_category
    create_items
    it 'can put items in cart, create account, and view items after logging in' do
      add_item_to_cart
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
    it "is not allowed to created account without username" do
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
