require 'rails_helper'

RSpec.describe 'Guest', type: :feature do
  create_roles
  feature 'can register' do
    it 'as admin' do
      visit root_path

      click_link "Create Business Account"

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'rickross'
      fill_in 'First name', with: 'Ross'
      fill_in 'Last name', with: 'Edfort'
      fill_in 'Email address', with: 'email_address@fake.com'
      fill_in 'Phone number', with: '101-101-1001'
      fill_in 'Image url', with: 'http://buddies.koinup.com/group-637.png'
      fill_in 'Bio', with: 'This is my store'

      click_button "Create Account"

      fill_in "Name", with: "Lenny's"

      click_button "Create Store"

      expect(current_path).to eq(admin_dashboard_path)

      expect(page).to have_content('Admin Dashboard')

      visit '/stores/lenny-s'

      expect(page).to have_content("Lenny's")
    end
  end
end
