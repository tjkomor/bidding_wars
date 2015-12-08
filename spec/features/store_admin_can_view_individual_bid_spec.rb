require 'rails_helper'
RSpec.describe 'store admin', type: :feature do
  create_category
  create_store
  create_items
  create_user

  feature 'can view' do
    xit 'individual order info' do
      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "View Customers"

      click_link "Ross Edfort"

      expect(page).to have_content('Order History')

      click_link rental_one.id
      within("#order_item_row_#{order_one.items.first.id}") do
        expect(page).to have_content('Casino')
        expect(page).to have_content("Winning bid")
      end
      expect(page).to have_content("Ross Edfort")
      expect(page).to have_content('$30')
      expect(page).to have_content('Completed')
      # expect(page).to have_content("1510 Blake Street Denver CO, 80202")
      expect(page).to have_content("08:29AM - 11/11/2015")
    end
  end
end
