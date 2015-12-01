require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'Items' do
    it 'can create items' do
      skip
    end
    it 'cannot create an item without required fields' do
      skip
    end
  end
end
