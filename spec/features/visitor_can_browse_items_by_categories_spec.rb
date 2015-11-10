require 'rails_helper'

RSpec.describe "VisitorCanBrowseItemsByCategories", type: :feature do
  feature "visitor" do
    let!(:category) { Category.create(name: 'Lenses') }
    let!(:item_one) { Item.create(name: '70-200 Canon L', description: "portrait lens", price: 12, category_id: category.id) }

    it "can browse items by category" do
      visit root_path
      click_link "Lenses"

      expect(current_path).to eq(category_path(category))
      within('.items') do
        expect(page).to have_content(item_one.name)
        expect(page).to have_content(item_one.description)
        expect(page).to have_content(item_one.price)
      end
    end
  end
end
