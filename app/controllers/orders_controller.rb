class OrdersController < ApplicationController

  def index
    @orders = Order.all
    @orders = Order.geocoded
    @markers = @orders.map do |ord|
      {
        lat: ord.latitude,
        lng: ord.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { ord: order }),
        image_url: helpers.asset_url('marker_icon.png')
      }
    end

  end

  def create
    # todo: implementer la methode order_params
    cart = Cart.find(params[:cart])
    @order = Order.new(cart: cart)
    sum = 0
    cart.cart_items.each do |a|
      sum += a.package.price * a.quantity
    end
    @order.amount = sum
    if @order.save
      redirect_to edit_order_path(@order)
    else
      render 'edit'
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.restaurant = Restaurant.first
    @order.address_end = Restaurant.first.address
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
    params.require(:order).permit(:status, :day, :time_start, :time_end, :address_start)
 end
end
