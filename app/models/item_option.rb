class ItemOption < ApplicationRecord
  belongs_to :item

  has_and_belongs_to_many :variants
end
