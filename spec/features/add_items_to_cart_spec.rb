require 'rails_helper'

RSpec.describe "Visitor", type: :feature do
  create_category
  # create_brand
  # create_items
  create_user
  feature "cart" do
    it "can add an item" do
      skip
      login_user
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      expect(page).to have_content("#{item_one.name} Added to Cart!")
      find("#cart-link").click
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("#{item_one.name}")
      expect(page).to have_content("#{item_one.description}")
      expect(page).to have_content("$#{item_one.price} per day")
    end

    feature "cart error" do
      it "returns error message when cart is empty" do
        skip
        visit root_path
        find("#cart-link").click

        expect(page).to have_content("Cart is empty. Please add items.")
      end
    end
  end
end
