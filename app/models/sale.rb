class Sale < ApplicationRecord
  has_many :variants, through: :sale_variants
  has_many :sale_variants
  
  has_many :items, -> { uniq }, through: :variants

  def seconds_to_finish
    (self.finish - DateTime.now).to_i
  end
end
