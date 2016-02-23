class RootController < ApplicationController
  def index
    @sale = Sale.includes(:items, {
      sale_variants: {
        variant: :properties
      }
    })
    .where(:current => true)
    .first

    if(!@sale)
      return render :no_sale
    end
  end
end
