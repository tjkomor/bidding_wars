require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_category
  # create_brand
  # create_items
  create_user
  # create_rental
  # create_admin

  feature 'admin' do
    it 'can view list of all items' do
      skip
      create_rental_items

      visit root_path

      click_link "Login"

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      expect(page).to have_content('Admin Dashboard')
      expect(page).to have_button("View Items")

      click_button "View Items"

      expect(page).to have_link('70-200 Canon L')
      expect(page).to have_link('16-35 Canon L')
      expect(page).to have_link('Canon EOS Rebel T5 DSLR')
    end
  end
end
