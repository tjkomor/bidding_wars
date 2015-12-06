require 'rails_helper'

RSpec.describe type: :model do
  create_user

  it "is valid with first_line, city, state, zip and country" do
    skip
    # address = Address.new(line_one: '1510 Blake Street', city: 'Denver', state: 'CO', zip: '80202', country: 'USA', user_id: user_one.id)

    expect(address).to be_valid
  end

  it "is invalid without first_line" do
    skip
    # address = Address.new(city: 'Denver', state: 'CO', zip: '80202', country: 'USA', user_id: user_one.id)

    expect(address).to_not be_valid
  end

  it "is invalid without city" do
    skip
    # address = Address.new(line_one: '1510 Blake Street', state: 'CO', zip: '80202', country: 'USA', user_id: user_one.id)

    expect(address).to_not be_valid
  end

  it "is invalid without state" do
    skip
    # address = Address.new(line_one: '1510 Blake Street', city: 'Denver', zip: '80202', country: 'USA', user_id: user_one.id)

    expect(address).to_not be_valid
  end

  it "is invalid without zip" do
    skip
    # address = Address.new(line_one: '1510 Blake Street', city: 'Denver', state: 'CO', country: 'USA', user_id: user_one.id)

    expect(address).to_not be_valid
  end

  it "is invalid without country" do
    skip
    # address = Address.new(line_one: '1510 Blake Street', city: 'Denver', state: 'CO', zip: '80202', user_id: user_one.id)

    expect(address).to_not be_valid
  end

  it "is invalid without user id" do
    skip
    # address = Address.new(line_one: '1510 Blake Street', city: 'Denver', state: 'CO', zip: '80202', country: 'USA')

    expect(address).to_not be_valid
  end
end
