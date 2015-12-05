# As an admin,
# when I visit the homepage,
# and I click login,
# and I enter my correct credentials,
# I should be able to add items to inventory,
# view past orders from all users,
# view past orders from specific users,
# view total sales,
# view total sales per user


require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  feature '' do
    create admin
    create_rolesviews
    it '' do
      store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      store_admin.roles.clear << Role.find(2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)
      visit login_path

      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'admin'

      click_button 'Login'

      visit admin_dashboard_path

      assert page.has_content?("Admin Dashboard")
    end
  end
end
