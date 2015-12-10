require 'rails_helper'
RSpec.describe 'Admin', type: :feature do

  feature 'can' do
    create_category
    create_roles
    it 'edit store name' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: true)
      item = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, auction_length: 48, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button 'Login'

      click_button "Edit Store Info"

      fill_in "Name", with: "New Name"
      click_button "Edit"

      expect(page).to have_content("New Name Admin Dashboard")
    end
  end
end
