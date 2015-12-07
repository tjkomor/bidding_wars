ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require "database_cleaner"
require "mocha/mini_test"
require "simplecov"

SimpleCov.start

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  def create_category
    let!(:category) { Category.create(name: 'Video Games') }
  end

  def create_store
    let!(:store) { Store.create(name: "Lenny's", status: true) }
  end

  def create_items
    let!(:item_one) { Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png', auction_length: 48 ) }
  end

  def create_user
    let!(:user_one) { User.create(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024', role: 0, active: true) }
    # let!(:address) { user_one.addresses.create(line_one: "1510 Blake Street", line_two: nil, city: "Denver", state: 'CO', zip: '80202', country: "USA" )}
  end

  def create_roles
    let!(:user) {Role.create(name: "user")}
    let!(:store_admin) {Role.create(name: "store_admin")}
    let!(:platform_admin) {Role.create(name: "platform_admin")}
  end

  def create_store_admin
    let!(:admin_one) { User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678') }
  end

  def create_order
    let!(:order_one) { Order.create(user_id: User.last.id, total_price: 190, status: 'Completed', created_at: "2015-11-11 15:29:36") }
  end

  def create_rental_items
    RentalItem.create(rental_id: rental_one.id, item_id: item_one.id, quantity: 2)
    RentalItem.create(rental_id: rental_one.id, item_id: item_two.id, quantity: 1)
    RentalItem.create(rental_id: rental_two.id, item_id: item_three.id, quantity: 1)
  end

  def add_item_to_cart
    visit items_path
    first(:button, "See Auction Details").click
  end

  def login_user
    visit login_path
    fill_in 'Username', with: 'rossedfort'
    fill_in 'Password', with: 'password'
    click_button "Login"
  end

  def login_store_admin
    visit login_path
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'admin'
    click_button "Login"
  end
end
