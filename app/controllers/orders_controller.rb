class OrdersController < ApplicationController

  def create

    @carted_products = CartedProduct.where("status LIKE ?", "carted%")
    
    @subtotal = 0
    @tax = 0
    @total = 0
    
    @carted_products.each do |carted_product|
      @subtotal += (carted_product.product.price * carted_product.quantity).to_f
      @tax += (carted_product.product.tax * carted_product.quantity).to_f
      @total += (carted_product.product.total * carted_product.quantity).to_f
    end

    @order = Order.create({user_id: current_user.id, 
                            subtotal: @subtotal, 
                            tax: @tax, 
                            total: @total})

    @carted_products.each do |carted_product|
      carted_product.order_id = @order.id
      carted_product.status = "purchased"
      carted_product.save
    end


    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
  end

end
