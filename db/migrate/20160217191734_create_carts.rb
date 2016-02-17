class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false
      t.datetime :last_modified

      t.timestamps null: false
    end
  end
end
