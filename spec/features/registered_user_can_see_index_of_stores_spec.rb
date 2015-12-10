require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_roles
  create_user

  feature 'Stores' do
    it 'can see list of all stores' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.where(name: 'store_admin').first
      store_admin.stores.create(name: "Waldo's", status: "Active")

      store_admin_two = User.create(username: 'admin_tow', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin_two.roles.clear << Role.where(name: 'store_admin').first
      store_admin_two.stores.create(name: "Tyler's", status: "Active")

      user_one.roles.clear << Role.where(name: 'user').first

      visit login_path

      fill_in 'Username', with: 'rossedfort'
      fill_in 'Password', with: 'password'

      click_button 'Login'

      visit stores_path

      expect(page).to have_content("Waldo's")
      expect(page).to have_content("Tyler's")
    end
  end
end
