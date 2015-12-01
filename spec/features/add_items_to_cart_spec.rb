require 'rails_helper'

RSpec.describe "Visitor", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  feature "cart" do
    it "can add an item" do
      skip
    end
    feature "cart error" do
      skip
      end
    end
end
