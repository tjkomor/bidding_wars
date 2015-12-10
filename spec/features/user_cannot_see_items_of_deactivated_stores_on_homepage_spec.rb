require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_store
  create_items
  create_roles
  create_user
  feature 'cannot see' do
    it 'info for deactivated store' do
      user_one.roles.clear << Role.where(name: 'user').first
      store.items.create(name: 'Casino', description: "classic video game", current_bid: 30, category_id: Category.last.id, active: true, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png', auction_length: 48 )
      visit login_path

      fill_in "Username", with: 'rossedfort'
      fill_in "Password", with: 'password'

      click_button "Login"

      visit items_path

      expect(page).to_not have_content('Casino')

      store.activate

      visit items_path


      expect(page).to have_content('Casino')

      store.deactivate

      visit items_path

      expect(page).to_not have_content('Casino')
    end
  end
end
