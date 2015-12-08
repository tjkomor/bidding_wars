require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_store
  create_items
  create_user


  feature 'cannot access' do
    it 'another users bid history' do
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
