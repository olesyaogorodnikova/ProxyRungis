class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    if @order.save
      redirect_to orders_path
    else
      render :edit
    end
  end

  def create

  end

  def update
    @order = Order.find(params[:id])
    @order.update(params[:order])
    redirect_to orders_path
  end

end
