class Sale << ApplicationRecord
  has_many :variants, through: :sales_variants
  
  has_many :items, -> { uniq } through: :variants
end
