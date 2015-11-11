# Background: An existing user that has multiple rentals
#       As an Authenticated User
#       When I visit "/rentals"
#       Then I should see all rentals belonging to me

require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental


  feature 'viewing past rentals' do
    it 'shows list of past rentals' do
      create_rental_items
      login_user
      visit user_rentals_path(user_one)

      expect(page).to have_content(rental_one.id)
      expect(page).to have_content('Nov. 11 2015')
      expect(page).to have_content($60)
    end
  end
end
