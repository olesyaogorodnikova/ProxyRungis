class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path
    else
      render 'new'
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
