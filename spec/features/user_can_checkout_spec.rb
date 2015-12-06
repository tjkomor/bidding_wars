require 'rails_helper'

RSpec.describe "User", type: :feature, js: true do
  create_category
  # create_brand
  # create_items
  create_user
  feature "Cart" do
    it "can checkout" do
      skip
      login_user
      add_item_to_cart
      visit cart_path
      fill_in "days", with: 5
      click_button "Pay with Card"

      sleep(2)
      stripe_iframe = all('iframe[name=stripe_checkout_app]').last
      Capybara.within_frame stripe_iframe do
        page.execute_script(%Q{ $('input#email').val('jamesdd9302@yahoo.com'); })
          page.execute_script(%Q{ $('input#card_number').val('4242424242424242'); })
          page.execute_script(%Q{ $('input#cc-exp').val('08/44'); })
          page.execute_script(%Q{ $('input#cc-csc').val('999'); })
          page.execute_script(%Q{ $('#submitButton').click(); })
        sleep(10)
      end

      expect(current_path).to eq(user_rentals_path(user_one))
      expect(page).to have_content("Order was successfully placed")
      expect(page).to have_content("70-200 Canon L")
      expect(page).to have_content("portrait lens")
    end

    it "can checkout" do
      skip
      login_user
      # add_item_to_cart
      visit cart_path
      fill_in "days", with: 5
      click_button "Pay with Card"

      sleep(2)
      stripe_iframe = all('iframe[name=stripe_checkout_app]').last
      Capybara.within_frame stripe_iframe do
        page.execute_script(%Q{ $('input#email').val('blah@blah.com'); })
          page.execute_script(%Q{ $('input#card_number').val('8383838383838383'); })
          page.execute_script(%Q{ $('input#cc-exp').val('08/44'); })
          page.execute_script(%Q{ $('input#cc-csc').val('999'); })
          page.execute_script(%Q{ $('#submitButton').click(); })
        sleep(10)
      end

      expect(current_path).to eq(cart_path)

    end
  end
end
