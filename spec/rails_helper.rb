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
    let!(:item_one) { Item.create(name: 'Casino', description: "classic video game", current_bid: 30, store_id: Store.last.id, category_id: Category.last.id, active: true, image_url: 'https://www.mymediabox.com/wp-content/uploads/2014/03/Atari-Casino.png') }
  end

  def create_user
    let!(:user_one) { User.create(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024', role: 0, active: true) }
    let!(:address) { user_one.addresses.create(line_one: "1510 Blake Street", line_two: nil, city: "Denver", state: 'CO', zip: '80202', country: "USA" )}
  end

  def create_admin
    let!(:admin_one) { User.create(username: 'admin', password: 'admin', first_name: 'tyler', last_name: 'komoroske', email_address: 'tjk@yahoo.com', phone_number: '518-339-1255', role: 1) }
  end

  def create_rental
    let!(:rental_one) { Rental.create(user_id: User.last.id, days_rented: 5, total_price: 190, status: 'Completed', created_at: "2015-11-11 15:29:36") }
    let!(:rental_two) { Rental.create(user_id: User.first.id, days_rented: 2, total_price: 28, status: 'Out', created_at: "2015-11-11 15:29:36") }
  end

  def create_rental_items
    RentalItem.create(rental_id: rental_one.id, item_id: item_one.id, quantity: 2)
    RentalItem.create(rental_id: rental_one.id, item_id: item_two.id, quantity: 1)
    RentalItem.create(rental_id: rental_two.id, item_id: item_three.id, quantity: 1)
  end

  def add_item_to_cart
    visit items_path
    first(:button, "Add to Cart").click
  end

  def login_user
    visit login_path
    fill_in 'Username', with: 'rossedfort'
    fill_in 'Password', with: 'password'
    click_button "Login"
  end
end
