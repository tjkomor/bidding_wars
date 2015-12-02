require 'rails_helper'

RSpec.describe 'Guest', type: :feature do
  create_store
  create_category
  create_items
  feature 'Bidding' do
    it 'must be logged in' do
      visit root_path

      click_link "Video Games"
      
      within("#item_#{item_one.id}") do
        click_button "Bid!"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Login")
    end
  end
end
