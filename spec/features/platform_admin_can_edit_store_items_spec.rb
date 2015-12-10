require 'rails_helper'

RSpec.describe "Platform Admin", type: :feature do
  create_category
  create_store
  create_items
  create_store_admin
  create_order
  create_roles

  feature "adds item" do
    it "to store" do
      platform_admin = User.create(username: 'platform_admin', password: 'platform_admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
      platform_admin.roles.clear << Role.all

      visit login_path

      fill_in "Username", with: 'platform_admin'
      fill_in "Password", with: 'platform_admin'

      click_button "Login"

      click_button "View Stores"

      within("#store-#{store.id}") do
        expect(page).to have_content("Pending")
        click_button "Activate"
      end

      expect(current_path).to eq(platform_admin_store_path(store))

      click_button "Add New Item"

      fill_in 'Name', with: 'Nikon D750 DSLR Camera'
      fill_in 'Description', with: 'Best 24.3 megapixel sensor eva'
      fill_in 'Current bid', with: '20'
      find('#categorySelect').find(:xpath, 'option[1]').select_option
      fill_in 'Auction length', with: '48'
      fill_in 'Image url', with: 'http://static.bhphoto.com/images/images500x500/1410504666000_1082599.jpg'

      click_button("Create Item")

      expect(page).to have_content('Item Created!')

      expect(page).to have_content("Admin Dashboard")

      click_link("View All Items")

      expect(page).to have_content("Nikon D750 DSLR Camera")

      within("#row_item_#{store.items.first.id}") do
        click_button "Edit"
      end

      fill_in "Name", with: "Marlo"

      click_button("Update Item")

      expect(page).to have_content("Marlo")
    end
  end
end
