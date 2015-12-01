require 'rails_helper'
RSpec.describe 'Admin', type: :feature do
  create_admin
  feature "login" do
    it 'is redirected to admin dashboard after logging in' do
      skip
    end
  end
end
