class Cart
  attr_reader :items

  def initialize(raw_data)
    @items = raw_data || {}
  end

  def add_item(item_id)
    items[item_id.to_s] ||= 0
    items[item_id.to_s] += 1
  end

  def total
    items.values.sum
  end

  def quantity_of(item_id)
    items[item_id.to_s]
  end

end
