class PackagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # raise
    @packages = Package.all
    @cart = user_cart
    @cart_item = CartItem.new
    if params[:category]
      @packages = Package.where(category: params[:category])
      if params[:category] == "all"
        @packages = Package.all
      end
    end
    if params[:bio]
      @packages = @packages.search_by_bio(true)
    end

  end
  # def show
  #   @package = Package.find(params[:id])
  #   @cart_item = CartItem.new
  #   # le .new n'inclut pas le save donc on peut instancier une coquille vide
  # end

  private

  def user_cart
    if current_user.cart.nil?
      Cart.create(user: current_user)
    else
      current_user.cart
    end
  end
end

