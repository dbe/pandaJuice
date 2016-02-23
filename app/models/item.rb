class Item < ApplicationRecord
  has_many :variants
  has_many :images
end
