require 'rails_helper'

RSpec.describe Rental, type: :model do
  let!(:user) { User.create(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024') }
  let!(:rental) { Rental.new(user_id: user.id, days_rented: 5, total_price: 60) }

  it "is valid with user_id days_rented and total_price" do
    expect(rental).to be_valid
  end

  it "is invalid without user_id" do
    rental.user_id = nil

    expect(rental).to_not be_valid
  end

  it "is invalid without days_rented" do
    rental.days_rented = nil

    expect(rental).to_not be_valid
  end

  it "is invalid without total_price" do
    rental.total_price = nil

    expect(rental).to_not be_valid
  end

  it "responds to item" do
    expect(rental).to respond_to(:items)
  end
end
