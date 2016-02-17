class SaleVariant < ApplicationRecord
  belongs_to :sale
  belongs_to :variant

  has_many :line_items
end
