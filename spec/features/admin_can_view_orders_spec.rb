require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'admin' do
    it 'can view all of the orders' do
      create_rental_items

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      expect(page).to have_content('190')
      expect(page).to have_content('5')
      expect(page).to have_content('Completed')
      within(".status_counts") do
        expect(page).to have_content('Completed 1')
        expect(page).to have_content('Out 1')
      end
    end

    it 'can click on a link to view individual orders' do
      create_rental_items

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      click_link rental_one.id

      expect(page).to have_link("70-200 Canon L")
      expect(page).to have_content("2")
      expect(page).to have_content("$120")
      expect(page).to have_content("Status: Completed")
    end

    it 'can update the status of an order to paid' do
      create_rental_items

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

    it 'can update the status of an order to cancelled' do
      create_rental_items

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      within("#row_rental_#{rental_one.id}") do
        click_button "Cancel"
      end
      within("#row_rental_#{rental_one.id}") do
        expect(page).to have_content("Cancelled")
      end
    end

    it 'can update the status of an order to cancelled' do
      create_rental_items

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
