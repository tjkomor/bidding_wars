class AddStatusToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :status, :string
  end
end
