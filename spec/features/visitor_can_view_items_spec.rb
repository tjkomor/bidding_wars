require "rails_helper"

RSpec.describe "VisitorCanViewItems", type: :feature do
  feature "View items" do
    let!(:item_one) {Item.create(name: "Canon 7d",
                                  description: "The best camera ever (NOT)",
                                  price: 15)}

    let!(:item_two) {Item.create(name: "Sony a7r",
                                  description: "Robbies camera",
                                  price: 12)}

    scenario "visitor can view items" do
      visit "/items"
      within("#heading") do
        expect(page).to have_content("Items")
      end
      within("#item_#{item_one.id}") do
        expect(page).to have_content(item_one.name)
        expect(page).to have_content(item_one.description)
        expect(page).to have_content(item_one.price)
      end
      within("#item_#{item_two.id}") do
        expect(page).to have_content(item_two.name)
        expect(page).to have_content(item_two.description)
        expect(page).to have_content(item_two.price)
      end
    end
  end
end
