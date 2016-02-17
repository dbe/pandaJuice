class AddSaleVariantJoinTable < ActiveRecord::Migration
  def change
    create_table :sale_variants do |t|
      t.belongs_to :sale, index: true
      t.belongs_to :variant, index: true

      t.integer :total_quantity
      t.integer :quantity_left
      t.decimal :cost, :precision => 8, :scale => 2
    end
  end
end
