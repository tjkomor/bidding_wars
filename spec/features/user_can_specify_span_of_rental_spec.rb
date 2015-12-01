require 'rails_helper'

RSpec.describe "User", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  feature "Cart" do
    it "can specify number of days for rental" do
      skip
    end
  end
end
