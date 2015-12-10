require 'rails_helper'

RSpec.describe 'Registered user', type: :feature do
  create_user
  create_roles
  create_category
  create_store
  create_items

  feature 'views' do
    it 'a bid text box to enter bid amount' do
      user_one.roles << Role.first

      store.activate

      visit root_path
      click_link "Login"

      fill_in "Username", with: user_one.username
      fill_in "Password", with: 'password'

      click_button "Login"

      visit items_path

      within "#item_#{item_one.id}" do
        click_button "See Auction Details"
      end

      expect(page).to have_content("#{item_one.name}")
      expect(page).to have_content("Current Bid: $#{item_one.current_bid}")

      fill_in "bid_amount", with: "40"
      click_button "Bid!"

      expect(page).to have_content("You have successfully bid $40 on Casino!")
      expect(page).to have_content("Current Bid: $40")

      visit dashboard_path

      expect(page).to have_content('Casino')
      expect(page).to have_content('$40')
    end
  end
end
