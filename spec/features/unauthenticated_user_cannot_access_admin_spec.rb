require 'rails_helper'

RSpec.describe 'Unauthenticated user', type: :feature do
  create_brand
  create_category
  create_items
    feature 'Access' do
      it 'cannot checkout without logging in' do
      add_item_to_cart
      visit cart_path
      
      click_button "Checkout"

      expect(page).to have_content("Login")
      expect(page).to have_content("Please login to continue")
    end

    it 'cannot access another users info' do
      visit user_rentals_path(user_one.id)
      expect(page).to have_content("Please Login before continuing")
    end
  end
end
