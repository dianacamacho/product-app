class ProductsController < ApplicationController

  def macbook
    @macbook = Product.first
    @products = Product.all
    @image = @macbook.image

  end

  def ipad
    @ipad = Product.find(2)
    @products = Product.all
    @image = @ipad.image
  end

  def apple_tv
    @apple_tv = Product.find(3)
    @products = Product.all
    @image = @apple_tv.image
  end

  def west_wing
      @west_wing = Product.find(4)
      @products = Product.all
      @image = @west_wing.image
  end

  def studio_60
    @studio_60 = Product.find(5)
    @products = Product.all
    @image = @studio_60.image
  end

  def newsroom
    @newsroom = Product.find(6)
    @products = Product.all
    @image = @newsroom.image
  end

  def sports_night
    @sports_night = Product.find(7)
    @products = Product.all
    @image = @sports_night.image
  end

  def ww_book
    @ww_book = Product.find(8)
    @products = Product.all
    @image = @ww_book.image
  end

  def a_few_good_men
    @a_few_good_men = Product.find(9)
    @products = Product.all
    @image = @a_few_good_men.image
  end

  def rizzo_jersey
    @rizzo_jersey = Product.find(10)
    @products = Product.all
    @image = @rizzo_jersey.image
  end

  def products
    @products = Product.all
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    @product = Product.create({name: params[:name],  price: params[:price], image: params[:image], description: params[:description]})
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update({name: params[:name], price: params[:price], image: params[:image], description: params[:description]})
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

end
