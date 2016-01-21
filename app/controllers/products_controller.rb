class ProductsController < ApplicationController

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
    @product = Product.create({name: params[:name],  price: params[:price], image: params[:image], description: params[:description], inventory: params[:inventory]})
    
    flash[:success] = "New Product created"

    redirect_to "/products"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update({name: params[:name], price: params[:price], image: params[:image], description: params[:description], inventory: params[:inventory]})
  
    flash[:success] = "Product updated!"

    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:success] = "Good job deleting product"
    flash[:warning] = "Product deleted"
    redirect_to "/products"
  end

end