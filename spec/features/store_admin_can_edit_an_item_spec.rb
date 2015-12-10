require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category
  create_roles
  create_store_admin

  feature 'Items' do
    it 'can edit items' do
      admin_one.roles.clear << Role.where(name: 'store_admin').first
      admin_one.stores.create(name: "Waldo's", status: true)
      item_one = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, auction_length: 48, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

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
      fill_in 'Current bid', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'
      click_button("Update Item")

      within("#row_item_#{item_one.id}") do
        expect(page).to have_content('Nikon D750 DSLR Camera')
        expect(page).to have_content('Best 24.3 megapixel sensor eva')
        expect(page).to have_css("img[src*='http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg']")
      end
    end

    it 'cannot update an item without a name' do      
      admin_one.roles.clear << Role.where(name: 'store_admin').first
      admin_one.stores.create(name: "Waldo's", status: true)
      item_one = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png', auction_length: 24)

      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      visit admin_items_path

      within("#row_item_#{item_one.id}") do
        click_button "Edit"
      end

      fill_in 'Name', with: ''
      fill_in 'Description', with: 'Best 24.3 megapixel sensor eva'
      fill_in 'Current bid', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'
      click_button("Update Item")
      expect(page).to have_content("Name cannot be blank")
    end
  end
end
