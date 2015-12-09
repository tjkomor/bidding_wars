class AddStatusToStores < ActiveRecord::Migration
  def change
    add_column :stores, :status, :boolean, default: false
  end
end
