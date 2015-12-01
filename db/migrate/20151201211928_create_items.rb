class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :current_bid
      t.references :store, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.boolean :active

      t.timestamps null: false
    end
  end
end
