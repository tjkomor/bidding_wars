require 'rails_helper'

RSpec.describe "Admin", type: :feature do
  create_category
  create_brand
  create_items
  create_user
  create_rental
  create_admin

  feature "Brand" do
    it "can create a brand" do
      skip
    end

    it "cannot create a brand with no name" do
      skip
    end
  end
end
