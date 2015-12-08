require 'rails_helper'

RSpec.describe 'Registered user', type: :feature do
  create_user
  feature 'picture' do

    xit 'can be added to profile' do
      visit root_path
      click_link "Create Account"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      save_and_open_page
      click_button "Login"

      expect(page).to have_content("My Dashboard")
      expect(page).to_not have_content("Login")

      click_button "Add Profile Picture"

      fill_in "Image_url", with: user_one.image_url
    end
  end

  feature 'bio' do
    it 'can be edited' do
      skip
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      expect(page).to have_content("My Dashboard")
      expect(page).to_not have_content("Login")

      click_button "Edit Bio"

      fill_in "Bio", with: "this is my bio"

      click_button "Done"

      expect(page).to have_content("My Dashboard")
      expect(page).to_not have_content("this is my bio")
    end
  end
end
