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
    let!(:category) { Category.create(name: 'Lenses') }
  end

  def create_brand
    let!(:brand) { Brand.create(name: 'Canon') }
  end

  def create_items
    let!(:item_one) { Item.create(name: '70-200 Canon L', description: "portrait lens", price: 12, brand_id: Brand.last.id, category_id: Category.last.id, retired: false, image_url: 'http://www.bhphotovideo.com/images/images1000x1000/sony_sel1635z_vario_tessar_t_e_16_35mm_1082052.jpg') }
    let!(:item_two) { Item.create(name: '16-35 Canon L', description: "wide angle lens", price: 14, brand_id: Brand.last.id, category_id: Category.last.id, retired: false, image_url: 'http://www.bhphotovideo.com/images/images1000x1000/sony_sel1635z_vario_tessar_t_e_16_35mm_1082052.jpg') }
    let!(:item_three) { Item.create(name: 'Canon EOS Rebel T5 DSLR', description: '18 MP APS-C CMOS Sensor', price: 14, image_url: 'http://static.bhphoto.com/images/images500x500/canon_9126b003_eos_a_rebel_t5_dslr_1392227429000_1030209.jpg', category_id:  Category.last.id, brand_id:  Brand.last.id, retired: true) }
  end

  def create_user
    let!(:user_one) { User.create(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024', role: 0) }
    let!(:address) { user_one.addresses.create(line_one: "1510 Blake Street", line_two: nil, city: "Denver", state: 'CO', zip: '80202', country: "USA" )}
  end

  def create_admin
    let!(:admin_one) { User.create(username: 'admin', password: 'admin', first_name: 'tyler', last_name: 'komoroske', email_address: 'tjk@yahoo.com', phone_number: '518-339-1255', role: 1) }
  end

  def create_rental
    let!(:rental_one) { Rental.create(user_id: User.last.id, days_rented: 5, total_price: 190, status: 'Completed', created_at: "2015-11-11 15:29:36") }
    let!(:rental_two) { Rental.create(user_id: User.last.id, days_rented: 2, total_price: 28, status: 'Ordered', created_at: "2015-11-11 15:29:36") }
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
