class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def products 
    @products = Product.all

    if params[:sort]
      @products = Product.order(params[:sort]) 
    elsif params[:sort_high]
      @products = Product.order(price: :desc)
    elsif params[:discount]
      @products = Product.where("price < ?", 10)
    end
  end

  def index
    @products = Product.all
    @images = Image.all

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

    if params[:category] 
      @products = Category.find_by(name: params[:category]).products
    end
  end

  def random
    id_array = Product.pluck(:id)
    random_id = id_array.sample
    @product = Product.find_by(id: random_id)

    render :show
  end

  def show
    @product = Product.find(params[:id])
    @carted_product = CartedProduct.new unless @carted_product
  end

  def new
    @product = Product.new
    @image = Image.new
  end

  def create
    @product = Product.new({name: params[:name],
                                price: params[:price], 
                                description: params[:description], 
                                inventory: params[:inventory],
                                supplier_id: params[:supplier][:supplier_id]})
    @image = Image.new(image_url: params[:image_url])
    

    if @product.save
      flash[:success] = "New Product created"
      if params[:image_url] != ""
        @image = Image.new(image_url: params[:image_url], 
                    product_id: @product.id) 
        unless @image.save
          flash[:warning] = "Image did not save"
          render "/images/new"
        else
          flash[:success] = "New image saved"
        end
      end  
      redirect_to "/products/#{@product.id}"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update({name: params[:name], 
                      price: params[:price], 
                      description: params[:description], 
                      inventory: params[:inventory],
                      supplier_id: params[:supplier][:supplier_id]})
  
      flash[:success] = "Product updated!"
      redirect_to "/products/#{@product.id}"
    else 
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:success] = "Good job deleting product"
    flash[:warning] = "Product deleted"
    redirect_to "/products"
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    render :index
  end
end