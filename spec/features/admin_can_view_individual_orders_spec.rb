require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin
  feature 'admin' do
    it 'can view individual order info' do
      create_rental_items

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      click_link rental_one.id
      # save_and_open_page
      expect(page).to have_content('70-200 Canon L')
      expect(page).to have_content("Ross Edfort")
      expect(page).to have_content('$120')
      expect(page).to have_content('Completed')
      expect(page).to have_content("1510 Blake Street Denver CO, 80202")
    end
  end
end
