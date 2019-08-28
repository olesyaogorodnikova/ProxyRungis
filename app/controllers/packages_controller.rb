class PackagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @packages = Package.all
    @cart_item = CartItem.new
  end

  # def show
  #   @package = Package.find(params[:id])
  #   @cart_item = CartItem.new
  #   # le .new n'inclut pas le save donc on peut instancier une coquille vide
  # end
end

