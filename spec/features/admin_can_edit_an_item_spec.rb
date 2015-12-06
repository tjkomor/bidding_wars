require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category

  create_roles

  feature 'Items' do
    it 'can edit items' do
        store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
        store_admin.roles.clear << Role.where(name: 'store_admin').first
        store_admin.stores.create(name: "Waldo's", status: true)
        item_one = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, auction_length: 48, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

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

      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      item_one = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

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
      save_and_open_page
      expect(page).to have_content("Name cannot be blank")
    end
  end
end
