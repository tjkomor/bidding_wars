require 'rails_helper'

RSpec.describe "User", type: :feature, js: true do
  create_category
  create_brand
  create_items
  create_user
  feature "Cart" do
    it "can checkout" do
      skip

    end

    it "can checkout" do
      skip
    end
  end
end
