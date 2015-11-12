class RemoveNameFromRental < ActiveRecord::Migration
  def change
    remove_column :rentals, :name, :string
  end
end
