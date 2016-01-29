class OrdersController < ApplicationController

  def create

    product = Product.find(params[:product_id])
    subtotal = product.price * params[:quantity].to_f
    tax = product.tax * params[:quantity].to_f
    total = product.total * params[:quantity].to_f


    @order = Order.create({user_id: current_user.id, 
                            product_id: params[:product_id], 
                            quantity: params[:quantity], 
                            subtotal: subtotal, 
                            tax: tax, 
                            total: total})

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
    @product = @order.product

     

  end

end
