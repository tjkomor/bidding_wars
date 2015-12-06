require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_category
  # create_brand
  # create_items
  create_user
  # create_rental
  # create_admin

  feature 'admin' do
    it 'can view individual order info' do
      skip
      create_rental_items

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      click_link rental_one.id
      within("#rental_item_row_#{rental_one.items.first.id}") do
        expect(page).to have_content('70-200 Canon L')
        expect(page).to have_content("1")
        expect(page).to have_content("12")
      end
      expect(page).to have_content("Ross Edfort")
      expect(page).to have_content('$120')
      expect(page).to have_content('Completed')
      expect(page).to have_content("1510 Blake Street Denver CO, 80202")
      expect(page).to have_content("08:29AM - 11/11/2015")
    end
  end
end
