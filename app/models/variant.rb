class Variant < ApplicationRecord
  has_many :sales, through: :sales_variants
end
