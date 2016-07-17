class ImagesController < ApplicationController
  before_action :authenticate_admin! 

  def new
    @product = Product.find(params[:id])
    @image = Image.new

  end

  def create
    @image = Image.new({image_url: params[:image_url], product_id: params[:product_id]})

    if @image.save 
      flash[:success] = "Image added!"
      redirect_to "/images"
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])

  end

  def update 
    @image = Image.find(params[:id])
    @image.update({image_url: params[:image_url]})

    flash[:success] = "Image updated!"
    redirect_to "/images/#{@image.id}"
  end 

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    flash[:warning] = "Image deleted"
    redirect_to "/"
  end
end
