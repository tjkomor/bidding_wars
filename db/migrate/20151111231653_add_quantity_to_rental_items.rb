class AddQuantityToRentalItems < ActiveRecord::Migration
  def change
    add_column :rental_items, :quantity, :string
  end
end
