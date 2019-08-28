class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def create
    # todo: implementer la methode order_params
    cart = Cart.find(params[:cart])
    @order = Order.new(cart: cart)
    if @order.save
      redirect_to edit_order_path(@order)
    else
      render 'new'
    end
  end

  def update
   @order = Order.find(params[:id])
   @order.update(params[:order])
   redirect_to orders_path
 end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    # if @order.save
    #   redirect_to orders_path
    # else
    #render :edit
    # end
  end

  private

  def order_params
   params.require(:order).permit(:status, :day, :time_start, :time_end, :address)
 end
end
