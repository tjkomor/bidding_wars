require 'rails_helper'

RSpec.describe 'Visitor', type: :feature do
  create_user
  feature 'Cart' do
    create_category
    create_brand
    create_items
    it 'can remove item' do
    login_user
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      find("#cart-link").click
      click_link "Remove"
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("Successfully removed #{item_one.name} from your cart.")
      expect(page).to have_link("#{item_one.name}")
      expect(page).to_not have_content("#{item_one.description}")
    end
  end
end
