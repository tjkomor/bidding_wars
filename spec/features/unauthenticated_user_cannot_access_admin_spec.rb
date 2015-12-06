require 'rails_helper'

RSpec.describe 'Unauthenticated user', type: :feature do
  # create_brand
  create_category
  # create_items
  create_user

  feature 'Access' do
    it 'cannot checkout without logging in' do
      skip
      add_item_to_cart
      visit cart_path

      expect(page).to have_button("Please Login")
    end

    it 'cannot access another users info' do
      skip
      visit user_rentals_path(user_one)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'cannot access admin dashboard' do
      skip
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
