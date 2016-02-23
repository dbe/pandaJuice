class AddPropertiesVariantsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :properties, :variants
  end
end
