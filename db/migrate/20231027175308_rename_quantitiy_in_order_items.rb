class RenameQuantitiyInOrderItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_items, :quantitiy, :quantity
  end
end
