require 'rails_helper'
RSpec.describe 'User', type: :feature do
  create_category
  create_store
  create_user
  create_items
  create_roles

  feature 'sees' do
    it 'date auction closes' do
      user_one.roles.clear << Role.where(name: 'user').first
      date = item_one.auction_close_time.strftime('%B, %d')
      time = item_one.auction_close_time.strftime('%r')

      visit login_path

      fill_in 'Username', with: 'rossedfort'
      fill_in 'Password', with: 'password'

      click_button "Login"

      visit "/items/#{item_one.id}"

      expect(page).to have_content("This auction closes on: #{date} at #{time}.")
    end
  end
end
