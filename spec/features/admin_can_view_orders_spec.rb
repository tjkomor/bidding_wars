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
    end
  end
end
