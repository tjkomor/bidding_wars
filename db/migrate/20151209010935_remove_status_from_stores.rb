class RemoveStatusFromStores < ActiveRecord::Migration
  def change
    remove_column :stores, :status, :boolean
  end
end
