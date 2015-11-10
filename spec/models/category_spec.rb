require "rails_helper"

RSpec.describe Category, type: :model do
  it "is valid with a name" do
    category = Category.new(name: "Lenses")

    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = Category.new()

    expect(category).to_not be_valid
  end

  it "must be a unique name" do
    category_one = Category.create(name: "Lenses")
    category_two = Category.new(name: "Lenses")

    expect(category_one).to be_valid
    expect(category_two).to_not be_valid
  end
end
