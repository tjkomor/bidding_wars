class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.integer :role
      t.boolean :active

      t.timestamps null: false
    end
  end
end
