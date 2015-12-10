require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category
  create_roles

  feature 'Items' do
    it 'can close auction early items' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: "Active")
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

      item_one.update(cancelled: true)
      item_one.set_permissions

      visit item_path(item_one.id)

      expect(item_one.cancelled).to be(true)
      expect(page).to have_content('Item no longer available.')
      expect(item_one.active).to be(false)
      expect(item_one.winning_bid).to be(nil)
    end
  end
end
