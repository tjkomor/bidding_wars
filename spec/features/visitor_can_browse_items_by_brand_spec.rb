require 'rails_helper'

RSpec.describe "VisitorCanBrowseItemsByBrands", type: :feature do
  feature "visitor" do
    create_category
    # create_brand
    # create_items

    it "can browse items by brand" do
      skip
      visit root_path
      click_link "Canon"

      expect(current_path).to eq(brand_path(brand))
      within('.items') do
        expect(page).to have_content(item_one.name)
        expect(page).to have_content(item_one.description)
        expect(page).to have_content(item_one.price)
        expect(page).to have_css("img[src*='http://www.bhphotovideo.com/images/images1000x1000/sony_sel1635z_vario_tessar_t_e_16_35mm_1082052.jpg']")
      end
    end
  end
end
