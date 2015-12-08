require 'rails_helper'
RSpec.describe 'Admin', type: :feature do

  feature 'can' do
    create_category
    create_roles
    xit 'view all items' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      item = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, auction_length: 48, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button 'Login'

      expect(page).to have_content("Admin Dashboard")
      expect(page).to have_content('View All Items')
      expect(page).to have_content('View Customers')
      expect(page).to have_content('View Active Auctions')
      expect(page).to have_content('View Past Orders')
      expect(page).to have_content('Total Sales')

      click_link 'View All Items'

      expect(page).to have_content(item.name)
    end

    xit 'create items' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      item = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, auction_length: 48, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      click_link_or_button "Add New Item"

      fill_in 'Name', with: 'Nikon D750 DSLR Camera'
      fill_in 'Description', with: 'Best 24.3 megapixel sensor eva'
      fill_in 'Current bid', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      fill_in 'Auction length', with: '48'
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'

      click_button("Create Item")

      expect(page).to have_content('Item Created!')
    end

    xit 'deactivate items' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      item = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, auction_length: 48, active: true, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      click_link_or_button "Add New Item"

      fill_in 'Name', with: 'Nikon D750 DSLR Camera'
      fill_in 'Description', with: 'Best 24.3 megapixel sensor eva'
      fill_in 'Current bid', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'
      fill_in 'Auction length', with: '48'
      click_button("Create Item")

      expect(page).to have_content('Item Created!')

      visit '/store/items'

      expect(page).to have_content("Deactivate")
    end
  end
end
