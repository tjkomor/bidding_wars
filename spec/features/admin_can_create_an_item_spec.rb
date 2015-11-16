require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'Items' do
    it 'can create items' do
      create_rental_items

      visit admin_dashboard_path

      click_button "New Item"

      expect(page).to have_content("Create Item")
    end
  end
end
