class Variant < ApplicationRecord
  has_many :sales, through: :sale_variants
  has_many :sale_variants

  has_and_belongs_to_many :item_options
end
