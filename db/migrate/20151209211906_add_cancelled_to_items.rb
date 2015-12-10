class AddCancelledToItems < ActiveRecord::Migration
  def change
    add_column :items, :cancelled, :boolean, default: false
  end
end
