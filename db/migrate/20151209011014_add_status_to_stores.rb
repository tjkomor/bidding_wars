class AddStatusToStores < ActiveRecord::Migration
  def change
    add_column :stores, :status, :string, default: "Pending"
  end
end
