# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @cart = Cart.create(user: current_user)
  end
end
