require 'rails_helper'

RSpec.describe 'Access', type: :feature do
  create_category
  # create_brand
  # create_items
  create_user
  # create_rental

  feature 'user' do
    it 'cannot access admin screens' do
      skip
      create_rental_items
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
      create_rental_items

      user_two = User.create(username: "bob",
                             password: "whatsup")
      visit root_path
      click_link "Login"

      fill_in "Username", with: user_two.username
      fill_in "Password", with: 'whatsup'

      click_button "Login"

      visit user_rentals_path(user_one)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
