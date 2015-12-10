require 'rails_helper'
RSpec.describe 'Platform admin', type: :feature do
  feature 'can' do
    create_category
    create_store
    create_items
    create_roles
    create_user

    it 'view active auctions' do
      platform_admin = User.create(username: 'platform_admin', password: 'platform_admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.all
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Phil's")

      visit login_path

      fill_in "Username", with: 'platform_admin'
      fill_in "Password", with: 'platform_admin'

      click_button "Login"

      click_button "View Stores"

      within("#store-#{store.id}") do
        expect(page).to have_content("Pending")
        click_button "Activate"
      end

      1.times do |i|
        if item_one.is_open
          bid_amount = item_one.current_bid + 5
          bid = BidHistory.create!(user_id: user_one.id, item_id: item_one.id, bid_amount: bid_amount)
          item_one.update(current_bid: bid_amount)
        end
      end


      expect(current_path).to eq(platform_admin_store_path(store))
      
      click_link "View Active Auctions"

      expect(page).to have_content("Casino")
      expect(page).to have_content("35")
    end
  end
end
