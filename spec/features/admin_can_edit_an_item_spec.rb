require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature 'Items' do
    it 'can edit items' do
      skip
    end

    it 'cannot update an item without a name' do
      skip
    end
  end
end
