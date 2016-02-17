class AddSaleVariantJoinTable < ActiveRecord::Migration
  def change
    create_join_table :sales, :variants do |t|
      t.integer :total_quantity
      t.integer :quantity_left
      t.decimal :cost, :precision => 8, :scale => 2
    end
  end
end
