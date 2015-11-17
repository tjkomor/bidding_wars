require 'rails_helper'
RSpec.describe 'User', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'Rental Length' do
    it 'add days to rental' do
      create_rental_items
      login_user
      visit dashboard_path(user_one)
      click_button "Extend Order"
    end
  end
end
