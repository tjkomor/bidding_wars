require 'rails_helper'
RSpec.describe 'Admin', type: :feature do

  feature 'can' do
    create_category
    create_roles
    it 'add admins' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      item = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, auction_length: 48, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button 'Login'

      expect(page).to have_content('View Active Auctions')

      click_button 'Add New Admin'

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'
      fill_in 'First name', with: 'Ross'
      fill_in 'Last name', with: 'Edfort'
      fill_in 'Email address', with: 'email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      fill_in 'Bio', with: 'This is my store, too'

      click_button "Create Account"

      expect(current_path).to eq(admin_dashboard_path)

      click_link 'Logout'

      visit login_path

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'

      click_button 'Login'

      expect(current_path).to eq(admin_dashboard_path)
      within("#title") do
        expect(page).to have_content("Waldo's")
      end
    end
  end
end
