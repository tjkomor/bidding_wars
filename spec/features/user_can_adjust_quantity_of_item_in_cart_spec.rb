require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  feature "Cart" do
    it "can adjust quantity of item" do
      login_user
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      find("#cart-link").click
      within "#item_row_#{item_one.id}" do
        fill_in 'quantity-field', with: "3"
        click_button "Update"
      end
      within "#item_row_#{item_one.id}" do
        expect(page).to have_content(item_one.name)
        expect(page).to have_field("quantity-field", with: "3")
      end
    end
  end
end
