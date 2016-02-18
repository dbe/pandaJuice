class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :item_id, null: false
      t.has_attached_file :photo

      t.timestamps
    end
  end
end
