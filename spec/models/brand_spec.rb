require 'rails_helper'

RSpec.describe "Brand", type: :model do
  it "is valid with a name" do
    skip
    # brand = Brand.new(name: "Canon")

    expect(brand).to be_valid
  end

  it "is invalid without a name" do
    skip
    # brand = Brand.new()

    expect(brand).to_not be_valid
  end

  it "must be a unique name" do
    skip
    # brand_one = Brand.create(name: "Canon")
    # brand_two = Brand.new(name: "Canon")

    expect(brand_one).to be_valid
    expect(brand_two).to_not be_valid
  end
end
