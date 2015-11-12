class AddTotalPriceToOrders < ActiveRecord::Migration
  def change
    add_column :rentals, :total_price, :integer
  end
end
