require 'rails_helper'
RSpec.describe 'store admin', type: :feature do
  create_category
  create_store
  create_store_admin
  create_items
  create_roles
  create_user

  feature 'can update' do
    it 'the status of an order to paid' do
      skip
      admin_one.roles << Role.where(name: 'store_admin').first
      store = admin_one.stores.create(name: 'Store')
      store.status = "Active"
      store.save
      item_one.update(store_id: store.id)
      item_one.save
      bid_amount = 10
      bid = BidHistory.create!(user_id: user_one.id, item_id: item_one.id, bid_amount: bid_amount)
      item_one.update(current_bid: bid_amount)
      order = user_one.orders.create(user_id: user_one.id, item_id: item_one.id, amount: 30, store_id: item_one.store.id)

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      click_link "View Pending Orders"

      expect(page).to have_content("#{item_one.name}")
      expect(page).to have_content("#{item_one.description}")
      expect(page).to have_content("#{item_one.name}")
    end
  end
end
