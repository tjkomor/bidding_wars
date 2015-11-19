require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  feature "Cart" do
    it "can specify number of days for rental" do
      login_user
      visit items_path
      within("#item_#{item_one.id}") do
        click_button "Add to Cart"
      end
      find("#cart-link").click
      within "#num_of_days" do
        fill_in "days-field", with: "5"
        click_button "Update"
      end
      expect(page).to have_content("Rent for 5 days")
      expect(page).to have_content("Total: $60")
    end
  end
end
