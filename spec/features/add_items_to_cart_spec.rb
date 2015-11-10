require 'rails_helper'

RSpec.describe "VisitorCanAddItemToCart", type: :feature do
  create_category
  create_items
  feature "visitor" do
    it "can add one item to cart" do
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      click_link "View Cart"
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("#{item.name} Added to Cart!")
      expect(page).to have_content("#{item_one.name}")
      expect(page).to have_content("#{item_one.description}")
      expect(page).to have_content("$#{item_one.price} per day")
      expect(page).to have_content("$#{item_one.price} total")
    end
  end
end
