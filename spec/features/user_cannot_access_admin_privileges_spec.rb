require 'rails_helper'

RSpec.describe 'Access', type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental

    feature 'user' do
      it 'cannot access admin screens' do
        skip
    end

    it 'cannot visit another users rental history' do
      skip
    end
  end
end
