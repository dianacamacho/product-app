class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
  end

  def create
    @image = Image.create({image_url: params[:image_url]})

    flash[:success] = "Image added!"

    redirect_to "/images"
  end

  def show
    @image = Image.find(params[:id])
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

    redirect_to "/images"
  end


end
