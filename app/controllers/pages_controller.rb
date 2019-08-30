# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    Cart.create(user: current_user) if current_user.cart.nil?
  end
end
