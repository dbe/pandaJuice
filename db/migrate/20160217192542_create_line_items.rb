class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :sale_variant_id, null: false
      t.integer :quantity, null: false
      t.decimal :actual_unit_price, null: false, precision: 8, scale: 2
    end
  end
end
