class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :value, null: false

      t.timestamps null: false

      t.index [:name, :value], unique: true
    end
  end
end
