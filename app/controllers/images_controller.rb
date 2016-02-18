class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
    @items = Item.all
  end

  def create
    @image = Image.create(image_params)

    if(@image.save)
      redirect_to @image
    else
      redirect_to :new
    end
  end


  private


  def image_params
    params.require(:image).permit(:item_id, :photo)
  end
end
