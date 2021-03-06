# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
    if current_user
      Cart.create(user: current_user) if current_user.cart.nil?
    end
  end

  def dashboard
    @orders = Order.all
    @myorders = current_user.orders
  end
end
