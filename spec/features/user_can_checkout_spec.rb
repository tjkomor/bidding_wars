require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  feature "Cart" do
    it "can checkout" do
      login_user
      add_item_to_cart
      visit cart_path(user_one)
      fill_in "days", with: 5
      click_button "Checkout"

      expect(current_path).to eq(user_rentals_path(user_one))
      expect(page).to have_content("Order was successfully placed")
      expect(page).to have_content("70-200 Canon L")
      expect(page).to have_content("portrait lens")
    end
  end
end
