require 'rails_helper'
RSpec.describe 'store admin', type: :feature do
  create_category
  create_items
  create_user

  feature 'can update' do
    xit 'the status of an order to paid' do
      skip
      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      within("#row_rental_#{rental_one.id}") do
        click_button "Mark as Paid"
      end
      within("#row_rental_#{rental_one.id}") do
        expect(page).to have_content("Paid")
      end
    end


    xit 'the status of an order to cancelled' do
      skip
      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      within("#row_rental_#{rental_one.id}") do
        click_button "Complete"
      end
      within("#row_rental_#{rental_one.id}") do
        expect(page).to have_content("Completed")
      end
    end
  end
end
