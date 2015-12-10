require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_user
  create_category
  create_store
  create_items

  feature 'Item' do
    it 'can view an item in store page' do
      store.activate
      visit 'stores/lenny-s'

      expect(page).to have_content(item_one.name)
    end

    it 'can view an item by clicking item picture from items index' do
      skip
      visit items_path


      click_link "image_#{item_one.id}"

      expect(current_path).to eq(item_path(item_one))
      expect(page).to have_content(item_one.name)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$#{item_one.current_bid}")
    end

    it 'can view an item by clicking item name from categories index' do
      skip
      visit "/video-games"

      click_link "#{item_one.name}"

      expect(current_path).to eq(item_path(item_one))
      expect(page).to have_content(item_one.name)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$#{item_one.current_bid}")
    end

    it 'can view an item by clicking item picture from categories index' do
      skip
      visit "/#{category.name.parameterize}"

      click_link "image_#{item_one.id}"

      expect(current_path).to eq(item_path(item_one))
      expect(page).to have_content(item_one.name)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$#{item_one.current_bid}")
    end
  end
end
