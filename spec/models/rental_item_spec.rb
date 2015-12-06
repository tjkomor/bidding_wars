RSpec.describe type: :model do
  # let!(:rental_item) { RentalItem.new( rental_id: 1, item_id: 3, quantity: 1) }

  it "is valid with a item_id rental_id and quantity" do
    skip
    expect(rental_item).to be_valid
  end

  it "is invalid without a item_id" do
    skip
    rental_item.item_id = nil

    expect(rental_item).to_not be_valid
  end

  it "is invalid without a rental_id" do
    skip
    rental_item.rental_id = nil

    expect(rental_item).to_not be_valid
  end

  it "is invalid without a quantity" do
    skip
    rental_item.quantity = nil

    expect(rental_item).to_not be_valid
  end
end
