require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_brand
  create_items
  feature 'Item' do
    it 'can view an item by clicking item name from items index' do
      skip
    end
  end
  feature 'Item' do
    it 'can view an item by clicking item picture from items index' do
      skip
    end
  end
  feature 'Item' do
    it 'can view an item by clicking item name from categories index' do
      skip
    end
  end
  feature 'Item' do
    it 'can view an item by clicking item picture from categories index' do
      skip
    end
  end

end
