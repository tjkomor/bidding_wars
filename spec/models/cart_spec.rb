require 'rails_helper'


RSpec.describe "cart", type: :model do
  it 'stores items' do
    cart = Cart.new({"1" => 1})
    expected = {"1" => 1}
    expect(cart.items).to eq(expected)
  end

  it 'can add item' do
    cart = Cart.new({"1" => 1})
    cart.add_item(1)

    expect(cart.items).to eq({"1" => 2})
  end

  it 'returns sum of all items' do
    cart = Cart.new({"1" => 1, "2" => 3})

    expect(cart.total).to eq(4)
  end

  it 'returns sum of specific item' do
    cart = Cart.new({"1" => 1, "2" => 3})

    expect(cart.quantity_of(2)).to eq(3)
  end
end
