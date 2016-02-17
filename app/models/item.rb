class Item < ApplicationRecord
  has_many :item_options
  has_many :variants
end
