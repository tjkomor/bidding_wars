require 'rails_helper'
RSpec.describe 'store admin', type: :feature do
  create_category
  create_store_admin
  create_user
  create_roles

  feature 'cannot modify' do
    it 'users account data' do
      user_two = User.create(username: 'ryan', password: 'password', first_name: 'Ryan', last_name: 'Johnson', email_address: 'rjohnson@yahoo.com', phone_number: '908-238-9234')
      admin_one.roles << Role.where(name: 'store_admin').first
      admin_one.stores.create(name: "Tyler's")
      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button "Login"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content('Admin Dashboard')

      visit edit_user_path(user_two.id)

      expect(page).to_not have_content("ryan")
      expect(page).to_not have_content("Ryan")
      expect(page).to_not have_content("Johnson")
      expect(page).to_not have_content("rjohnson@yahoo.com")      
    end
  end
end
