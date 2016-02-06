class CartedProductsController < ApplicationController

  before_action :authenticate_user! 

  def index

    if user_signed_in? && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      redirect_to "/"
      flash[:warning] = "Your cart is empty. Add products to cart."
    end      
  
  end

  def create
   
      @carted_product = CartedProduct.new({user_id: current_user.id, 
                                                product_id: params[:product_id],
                                                quantity: params[:quantity],
                                                status: "carted" })
      
      if @carted_product.save
        session[:cart_count] = nil

        flash[:success] = "Product added to cart"
        redirect_to "/cart"
      else
        @product = Product.find(params[:product_id])
        redirect_to "/products/#{@carted_product.product_id}"
      end
    
  end

  def show
    @carted_product = CartedProduct.find(params[:id])
  end

  def edit
    @carted_product = CartedProduct.find(params[:id])

  end

  def update
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])

    @carted_product.update({status: "removed"})
    session[:cart_count] = nil


    redirect_to "/cart"
    flash[:warning] = "Item removed."

  end


end
