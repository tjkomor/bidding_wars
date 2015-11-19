class Cart
  attr_reader :items

  def initialize(raw_data)
    @items = raw_data || {}
  end

  def contents
    item_ids = @items.keys.map { |key| key.to_i }
    Item.where(id: item_ids)
  end

  def add_item(item_id)
    items[item_id.to_s] ||= 0
    items[item_id.to_s] += 1
  end

  def remove_item(item_id)
    items.delete(item_id.to_s)
  end

  def total
    items.values.sum
  end

  def count
    if items["days"]
      items.count - 1
    else
      items.count
    end
  end

  def quantity_of(item_id)
    items[item_id.to_s]
  end

  def update_item(item_id, quantity)
    items[item_id.to_s] = quantity.to_i
  end

  def subtotal(item_id, price)
    price * quantity_of(item_id)
  end

  def number_of_days
    @items['days'] ||= 1
  end

  def update_number_of_days(days)
    @items['days'] = days.to_i
  end

  def total_price
    price_per_day = item_prices.reduce(:+)
    @total_price = (price_per_day * number_of_days)
  end

  private

  def item_prices
    contents.map { |item| item.price * items.fetch(item.id.to_s) }
  end
end
