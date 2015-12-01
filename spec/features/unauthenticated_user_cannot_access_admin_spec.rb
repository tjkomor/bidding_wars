require 'rails_helper'

RSpec.describe 'Unauthenticated user', type: :feature do

    feature 'Access' do
      it 'cannot checkout without logging in' do
        skip
      end

    it 'cannot access another users info' do
      skip
    end

    it 'cannot access admin dashboard' do
      skip
    end
  end
end
