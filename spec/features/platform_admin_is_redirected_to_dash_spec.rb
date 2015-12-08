require 'rails_helper'
RSpec.describe 'Platform Admin', type: :feature do
  feature 'login' do
    create_roles
    it 'view dashboard page' do
      platform_admin = User.create!(username: 'platformadmin', password: 'platformadmin', first_name: 'Clemson', last_name: 'Tigers', email_address: 'gotigers@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.where(name: 'platform_admin').first

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(platform_admin)

      visit login_path

      fill_in 'Username', with: 'platformadmin'
      fill_in 'Password', with: 'platformadmin'

      click_button 'Login'

      visit platform_admin_dashboard_path

      assert page.has_content?("Platform Admin Dashboard")
    end
  end
end
