require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental

  feature 'viewing a past rental' do
    it 'shows a rental' do
      skip
    end

    it 'shows retired items' do
      skip
    end
  end
end
