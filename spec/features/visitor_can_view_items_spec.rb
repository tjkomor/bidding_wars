# Background: I have several items and each of them has a title, description, price, and image
#       As a visitor
#       When I visit "/items"
#       I can see all existing items

require 'rails_helper'

feature "View items" do
  scenario "visitor can view items" do
    visit "/items"

    within("#heading") do
      expect(page).to have_content("Items")
    end
  end
end
