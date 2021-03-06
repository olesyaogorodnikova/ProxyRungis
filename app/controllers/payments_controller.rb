class PaymentsController < ApplicationController
  def new
    # triche: on a besoin d'une order a ce stade (et donc dun restaurant)

    @restaurants = Restaurant.geocoded
    @user = current_user

    @order = Order.find(params[:order_id])
    @center = [2.3800903, 48.864922]
    restaurant = Restaurant.find(@order.restaurant_id)

    @markers = [
      {
        lat_starts: @order.ltd_starts,
        lng_starts: @order.lng_starts,
        lat_ends: @order.ltd_ends,
        lng_ends: @order.lng_ends,
        infoWindow_1: render_to_string(partial: "info_window", locals: { order: @order }),
        infoWindow_2: render_to_string(partial: "info_order_window", locals: { restaurant: restaurant })
      }
    ]

    @order.direction_json
    direction = @order.direction
    @steps = direction["routes"].first["legs"].first["steps"]

    # @marker_address =
    # [{
    #   lat: @order.lat_starts,
    #   lng: @order.lng_starts,
    #   infoWindow: render_to_string(partial: "info_window", locals: {ord: @order })
    # }]
    # @markers =
    # {
    #   lat: @order.lat_ends,
    #   lng: @order.lng_ends,
    #   # infoWindow: render_to_string(partial: "info_order_window", locals: { restaurant: restaurant })
    # }
  end

  def create
    @order = Order.find(params[:order_id])

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents,
      description:  "Payment for order: #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, status: 'Payé')
    flash[:notice] = "Votre commande a bien été prise en compte!"
    redirect_to dashboard_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end
end
