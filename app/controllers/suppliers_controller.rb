class SuppliersController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @suppliers = Supplier.all
  end

  def new
  end

  def create
    @supplier = Supplier.create({name: params[:name], email: params[:email], phone: params[:phone]})

    flash[:success] = "Supplier added!"

    redirect_to "/suppliers"
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def edit
    @supplier = Supplier.find(params[:id])

  end

  def update 
    @supplier = Supplier.find(params[:id])
    @supplier.update({name: params[:name], email: params[:email], phone: params[:phone]})

    flash[:success] = "Supplier updated!"
    redirect_to "/suppliers/#{@supplier.id}"
  end 

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    flash[:warning] = "Supplier deleted"
    redirect_to "/suppliers"
  end
end
