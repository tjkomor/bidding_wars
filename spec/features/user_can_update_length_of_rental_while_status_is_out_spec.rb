require 'rails_helper'
RSpec.describe 'User', type: :feature, js: true do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'Rental Length' do
    it 'add days to rental' do
      skip
    end
  end
end
