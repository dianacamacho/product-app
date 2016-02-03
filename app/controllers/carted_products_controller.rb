class CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.create({user_id: current_user.id, 
                                              product_id: params[:product_id],
                                              quantity: params[:quantity],
                                              status: "carted" })


    redirect_to "/cart"
  end

  def index
    if current_user
      @carted_products = CartedProduct.all
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

    @carted_product.status = "removed"
    @carted_product.save

    redirect_to "/cart"

  end


end
