require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  feature 'views' do
    create_category
    create_roles
    it 'all store info' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.find(2)
      store_admin.stores.create(name: "Waldo's", status: true)
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
    end

    it 'all items' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      item = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

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
  end
end
