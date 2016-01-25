class ProductsController < ApplicationController

  def products #future index
    @products = Product.all

    if params[:sort]
      @products = Product.order(params[:sort]) 
    elsif params[:sort_high]
      @products = Product.order(price: :desc)
    elsif params[:discount]
      @products = Product.where("price < ?", 10)
    elsif params[:random]
      id_array = Product.pluck(:id)
      random_id = id_array.sample
      @products = Product.where("id = ?", random_id)
    end
      

  end

  def index
    @products = Product.all

    # if params[:sort]
    #   @products = Product.order(:price)
    # end

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

  def random
    @product = Product.all.sample

    render :show
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
  
    render :products
  end

end