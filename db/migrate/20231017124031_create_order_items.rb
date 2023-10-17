class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.integer :quantitiy

      t.timestamps
    end
  end
end
