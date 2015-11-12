class CreateRentalItems < ActiveRecord::Migration
  def change
    create_table :rental_items do |t|
      t.references :rental, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
