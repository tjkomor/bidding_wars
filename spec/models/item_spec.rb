require 'rails_helper'

RSpec.describe Item, type: :model do
  create_store
  create_category
  create_items

  it { should belong_to(:store) }
  it { should belong_to(:store) }
  it { should have_many(:bid_histories) }
  it { should have_many(:users) }

  it "increment bid" do
    bid_amount = 40

    expect(item_one.current_bid).to eq(30)

    item_one.increment_bid(bid_amount)

    expect(item_one.current_bid).to eq(bid_amount)
  end
end
