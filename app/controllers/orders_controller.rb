class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    # todo: implementer la methode order_params
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path # est-ce que la vue avec la map est bien la show de l'order
    else
      render 'new'
    end
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
end
