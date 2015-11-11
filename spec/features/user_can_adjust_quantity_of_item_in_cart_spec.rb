require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_brand
  create_items
  feature "Cart" do
    it "can adjust quantity of item" do
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      click_link "View Cart"
      within "#item_row_#{item_one.id}" do
        fill_in 'Quantity', with: "3"
      end
      click_button "Update"
      within "#item_row_#{item_one.id}" do
        expect(page).to have_content(item_one.name)
        expect(page).to have_field("Quantity", with: "3")
      end
    end
  end
end
