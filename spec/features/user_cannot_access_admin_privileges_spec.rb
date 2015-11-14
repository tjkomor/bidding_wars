require 'rails_helper'

#       As a registered user
#       When I visit "/admin/dashboard"
#       I get a 404
#       As an unregistered user
#       When I visit "/admin/dashboard"
#       I get a 404

RSpec.describe 'Access', type: :feature do
  create_user
    feature 'user' do
      it 'cannot access admin screens' do

      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      visit new_admin_category_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'cannot visit another users rental history' do
      skip
      user_three = User.create(username: "bob",
                               password: "whatsup")
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_three.username
      fill_in "Password", with: 'whatsup'

      click_button "Login"

      visit user_rentals_path(user_one.id)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end

# Background: An authenticated user and the ability to add an admin user
#       As an Authenticated User
#       I cannot view another user's private data (current or past orders, etc)
#       I cannot view the administrator screens or use admin functionality
#       I cannot make myself an admin
#
#
