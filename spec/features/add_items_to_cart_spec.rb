require 'rails_helper'

RSpec.describe "Visitor", type: :feature do
  create_category
  create_items
  feature "cart" do
    it "can add an item" do
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      expect(page).to have_content("#{item_one.name} Added to Cart!")
      click_link "View Cart"
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("#{item_one.name}")
      expect(page).to have_content("#{item_one.description}")
      expect(page).to have_content("$#{item_one.price} per day")
      expect(page).to have_content("Total: $#{item_one.price}")
    end
    feature "cart error" do
      it "returns error message when cart is empty" do
        visit root_path
        click_link "View Cart"

        expect(page).to have_content("Cart is empty. Please add items.")
      end
    end
  end
end
