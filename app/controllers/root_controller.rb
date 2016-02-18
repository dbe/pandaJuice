class RootController < ApplicationController
  def index
    @sale = Sale.includes(:items, {
      sale_variants: {
        variant: :item_options
      }
    }).first
  end
end
