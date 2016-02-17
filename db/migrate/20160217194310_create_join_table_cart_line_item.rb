class CreateJoinTableCartLineItem < ActiveRecord::Migration[5.0]
  def change
    create_join_table :carts, :line_items
  end
end
