class RootController < ApplicationController
  def index
    @sale = Sale.includes(:items, {
      sale_variants: {
        variant: :item_options
      }
    })
    .where(:current => true)
    .first

    if(!@sale)
      return render :no_sale
    end
  end
end
