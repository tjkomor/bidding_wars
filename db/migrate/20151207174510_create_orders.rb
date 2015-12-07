class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :store, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
