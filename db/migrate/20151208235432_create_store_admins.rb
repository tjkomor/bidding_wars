class CreateStoreAdmins < ActiveRecord::Migration
  def change
    create_table :store_admins do |t|
      t.references :store, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
