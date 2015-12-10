require 'rails_helper'
RSpec.describe 'store admin', type: :feature do
  create_store
  create_category
  create_items
  create_store_admin
  create_roles
  create_user

  feature 'can view' do
    it 'all of the past orders' do
      skip
      admin_one.roles << Role.where(name: 'store_admin')
      admin_one.stores.create(name: "Leons")
      order = user_one.orders.create(user_id: User.last.id, amount: 30, created_at: "2015-11-11 15:29:36")
      admin_one.stores.first.orders << order

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      click_link "View Past Orders"

      expect(page).to have_content("#{item_one.name}")
      expect(page).to have_content("#{item_one.description}")
      expect(page).to have_content('Ross')
      expect(page).to have_content('$30')
    end

    it 'can click on a link to view pending orders' do
      skip      
      admin_one.roles << Role.where(name: 'store_admin')
      admin_one.stores.create(name: 'Arias')
      order = user_one.orders.create(user_id: User.last.id, amount: 30, created_at: "2015-11-11 15:29:36")
      admin_one.stores.first.orders << order

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      click_link "View Pending Orders"

      expect(page).to have_link("#{item_one.name}")
      expect(page).to have_content("#{item_one.description}")
      expect(page).to have_content("$120")
      expect(page).to have_content("Status: Completed")
    end
  end
end
