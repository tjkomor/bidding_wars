require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental

  feature 'viewing past rentals' do
    it 'shows list of past rentals' do
      skip
    end
  end
end
