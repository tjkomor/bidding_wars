require 'rails_helper'

RSpec.describe 'Unauthenticated user', type: :feature do
  create_brand
  create_category
  create_items
  create_user
    feature 'Access' do
      it 'cannot checkout without logging in' do
      add_item_to_cart
      visit cart_path

      click_button "Checkout"

      expect(page).to have_content("Login")
    end

    it 'cannot access another users info' do
      visit user_rentals_path(user_one)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'cannot access admin dashboard' do
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
