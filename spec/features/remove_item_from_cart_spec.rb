require 'rails_helper'

RSpec.describe 'Visitor', type: :feature do
  feature 'Cart' do
    create_category
    create_brand
    create_items
    it 'can remove item' do
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      click_link "View Cart"
      click_link "Remove"
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("Successfully removed #{item_one.name} from your cart.")
      expect(page).to have_link("#{item_one.name}")
      expect(page).to_not have_content("#{item_one.description}")
    end
  end

end

# Background: My cart has an item in it
#       As a visitor
#       When I visit "/cart"
#       And I click link "Remove"
#       Then my current page should be "/cart"
#       And I should see a message styled in green
#       And the message should say "Successfully removed SOME_ITEM from your cart."
#       And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
#       And I should not see the item listed in cart
