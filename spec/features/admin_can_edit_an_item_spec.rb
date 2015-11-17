require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'Items' do
    it 'can edit items' do
      create_rental_items

      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      visit admin_items_path


      within("#row_item_#{item_one.id}") do
        click_button "Edit"
      end
      fill_in 'Name', with: 'Nikon D750 DSLR Camera'
      fill_in 'Description', with: 'Best 24.3 megapixel sensor eva'
      fill_in 'Price', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      find('#brandSelect').find(:xpath, 'option[1]').select_option
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'
      click_button("Update Item")

      within("#row_item_#{item_one.id}") do
        expect(page).to_not have_content("Item no longer available")
        expect(page).to have_content('Nikon D750 DSLR Camera')
        expect(page).to have_content('Best 24.3 megapixel sensor eva')
        expect(page).to have_css("img[src*='http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg']")
      end
    end
  end
end
