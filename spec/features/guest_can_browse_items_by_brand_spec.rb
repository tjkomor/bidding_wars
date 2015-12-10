require 'rails_helper'

RSpec.describe "Visitor", type: :feature do
  feature "browsing site" do
    create_store
    create_category
    create_items

    it "can view items" do
      visit root_path
      click_link "Shop All"

      within('.items') do
        expect(page).to have_content(item_one.name)
        expect(page).to have_content(item_one.current_bid)
      end
    end

    it "can view items by category" do
      visit root_path
      click_link "Shop Categories"

      click_link "Video Games"

      within('.items') do
        expect(page).to have_content(item_one.name)
        expect(page).to have_content(item_one.current_bid)
      end
    end

    it "can view items by store" do
      visit root_path
      click_link "Shop Stores"

      within("#dropdown#{}") do
        click_link "Lenny's"
      end

      within('.items') do
        expect(page).to have_content(item_one.name)
        expect(page).to have_content(item_one.current_bid)
      end
    end
  end
end
