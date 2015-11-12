require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental

  feature 'viewing a past rental' do
    it 'shows a rental' do
      create_rental_items
      login_user
      visit user_rentals_path(user_one)
      click_link rental_one.id

      expect(current_path).to eq(user_rental_path(id: rental_one.id, user_id: user_one.id))
      expect(page).to have_link("70-200 Canon L")
      expect(page).to have_content("2")
      expect(page).to have_content("$120")
      expect(page).to have_content("Status: Completed")
      expect(page).to have_content("Total: $190")
      expect(page).to have_content("Order placed at: 03:29PM - 11/11/2015")
    end

    it 'shows retired items' do
      create_rental_items
      login_user
      visit user_rental_path(id: rental_two.id, user_id: user_one.id)

      expect(page).to have_content('Item no longer available')

      click_link item_three.name
      expect(page).to have_button('Add to cart', disabled: true)
      expect(page).to have_content('Item no longer available')
    end
  end
end
