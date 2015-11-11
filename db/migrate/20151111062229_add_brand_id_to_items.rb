class AddBrandIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :brand, index: true, foreign_key: true
  end
end
