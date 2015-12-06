require 'rails_helper'
RSpec.describe 'User', type: :feature do
  create_user
  create_items
  feature 'sees' do
    it 'time left on auction' do
      visit login_path

      fill_in 'Username', with: 'rossedfort'
      fill_in 'Password', with: 'password'

      click_button "Login"

      visit "/items/#{item_one.id}"

      expect(page).to have_content('2456')
    end
  end
end
