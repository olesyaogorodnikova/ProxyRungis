class OrdersController < ApplicationController
  def index
    @orders = Order.all
   # @orders_geocoded = Order.geocoded

   # @markers = @orders_geocoded.map do |order|
    #  {
     #   lat: order.latitude,
      #  lng: order.longitude
      #}
    #end
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
