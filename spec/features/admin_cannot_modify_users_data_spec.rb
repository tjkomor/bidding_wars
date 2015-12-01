require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_admin
  create_user
  feature 'admin' do
    it 'cannot modify users account data' do
      skip
    end
  end
end
