require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'Items' do
    it 'can create items' do
      create_rental_items

      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      click_link_or_button "New Item"

      fill_in 'Name', with: 'Nikon D750 DSLR Camera'
      fill_in 'Description', with: 'Best 24.3 megapixel sensor eva'
      fill_in 'Price', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      find('#brandSelect').find(:xpath, 'option[1]').select_option
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'
      click_button("Create Item")

      expect(page).to have_content('Item Created!')
    end
    it 'cannot create an item without required fields' do
      create_rental_items

      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      click_link_or_button "New Item"

      fill_in 'Description', with: 'Best 24.3 megapixel sensor eva'
      fill_in 'Price', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      find('#brandSelect').find(:xpath, 'option[1]').select_option
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'
      click_button("Create Item")

      expect(page).to_not have_content('Item Created!')
      expect(page).to have_content("Name cannot be blank")
    end
  end
end
