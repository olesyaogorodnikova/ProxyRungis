class PaymentsController < ApplicationController
  def new
    # triche: on a besoin d'une order a ce stade (et donc dun restaurant)
    restaurant = Restaurant.first
    @user = current_user

    @order = Order.find(params[:order_id])
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

    @order.update(payment: charge.to_json, status: 'paid')
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

end
