class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :name
      t.integer :days_rented
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
