require 'rails_helper'
RSpec.describe 'Platform Admin', type: :feature do
  feature 'can view' do
    create_roles
    create_user
    create_category
    create_store
    create_items

    it 'pending orders for stores' do
      platform_admin = User.create!(username: 'platformadmin', password: 'platformadmin', first_name: 'Clemson', last_name: 'Tigers', email_address: 'gotigers@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.where(name: 'platform_admin').first
      bid_one = item_one.bid_histories.create!(user_id: user_one.id, bid_amount: 45)
      item_one.update(auction_length: -8)
      visit login_path

      fill_in 'Username', with: 'platformadmin'
      fill_in 'Password', with: 'platformadmin'

      click_button 'Login'

      visit platform_admin_dashboard_path

      assert page.has_content?("Platform Admin Dashboard")

      click_button 'View Stores'

      click_link "Lenny's"

      click_link "View Pending Orders"

      expect(page).to have_content('Ross')
      expect(page).to have_content('Casino')

      click_button "Finalize Order"

      expect(page).to have_content "Store's Past Orders"
    end
  end
end
