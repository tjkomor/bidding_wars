require 'rails_helper'

RSpec.describe 'Guest', type: :feature do
  create_store
  create_category
  create_items
  create_user
  feature 'Bidding' do
    it 'must be logged in' do
      visit root_path

      click_link "Video Games"

      within("#item_#{item_one.id}") do
        click_button "See Auction Details"
      end

      click_button "Bid!"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Login")

      fill_in 'Username', with: 'rossedfort'
      fill_in 'Password', with: 'password'
      click_button "Login"

      expect(current_path).to eq(item_path(item_one.id))

      within("#item_#{item_one.id}") do
        click_button "Bid!"
      end

      expect(page).to have_content("Successfully Bid on Item")

      visit '/dashboard'

      expect(page).to have_content("#{item_one.name}")
    end
  end
end
