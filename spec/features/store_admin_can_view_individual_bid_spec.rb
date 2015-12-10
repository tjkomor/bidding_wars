require 'rails_helper'
RSpec.describe 'store admin', type: :feature do
  create_category
  create_store
  create_store_admin
  create_roles
  create_items
  create_user

  feature 'can view' do
    it 'individual order info' do
      admin_one.roles << Role.where(name: 'store_admin')
      admin_one.stores.create(name: 'Amber')
      admin_one_store = admin_one.stores.first
      user_one.orders.create(store_id: admin_one_store.id, amount: 30, item_id: item_one.id)
      admin_one.stores.first.items << item_one

      visit login_path

      fill_in "Username", with: 'admin'
      fill_in "Password", with: 'admin'

      click_button "Login"

      click_link "View Customers"

      expect(page).to have_content("Ross")
      expect(page).to have_content("#{item_one.name}")
    end
  end
end
