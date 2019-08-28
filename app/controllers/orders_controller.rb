class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to edit_order_path(@order)
    else
      render 'new'
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    # if @order.save
    #   redirect_to orders_path
    # else
    #   render :edit
    # end
  end
end
