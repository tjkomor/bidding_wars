require 'rails_helper'

RSpec.describe "User" do
  create_user
  create_roles
  feature "Login" do
    it "can log in" do
      user_one.roles.clear << Role.where(name: 'user').first
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      expect(page).to_not have_content("Login")
      expect(page).to have_content("#{user_one.first_name}'s Dash")
    end

    it "cannot log in with invalid credentials" do
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'rickross'

      click_button "Login"

      expect(page).to have_content("Invalid Credentials")
      expect(page).to_not have_content("Logged in as: rossedfort")
    end
  end
end
