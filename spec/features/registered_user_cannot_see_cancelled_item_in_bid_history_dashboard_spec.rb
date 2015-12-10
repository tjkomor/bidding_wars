require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_roles
  create_user

  feature 'Items' do
    it 'cannot see past bid on item if auction was cancelled' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: "Active")
      user_one.roles.clear << Role.where(name: 'user').first


      item_one = Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, auction_length: 48, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png')

      visit login_path

      fill_in 'Username', with: 'rossedfort'
      fill_in 'Password', with: 'password'

      click_button 'Login'

      visit item_path(item_one)

      fill_in "bid_amount", with: "40"
      click_button "Bid!"

      expect(item_one.winning_bid.first.user.username).to eq(user_one.username)


      item_one.update(cancelled: true)
      item_one.set_permissions
      visit item_path(item_one.id)

      expect(item_one.cancelled).to be(true)
      expect(page).to have_content('Item no longer available.')

      expect(item_one.winning_bid).to be(nil)
    end
  end
end
