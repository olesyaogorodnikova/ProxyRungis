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
      render 'edit'
    end
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to new_order_payment_path(@order)
 end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    @restaurants = Restaurant.geocoded
    # modif le center une fois le migrate de usr generate.
    @center = [2.3800903, 48.864922]
    @markers = @restaurants.map do |restaurant|
    {
      lat: restaurant.latitude,
      lng: restaurant.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
    }
    end
  end

  private

  def order_params
   params.require(:order).permit(:status, :day, :time_start, :time_end, :address)
 end
end
