class CartItemsController < ApplicationController

  # def show
  #   @package = Package.find(params[:package_id])
  #   @cart_item = Cart_item.new
  #   @cart_item.package = @package
  # end

  def create
    @package = Package.find(params[:package_id])
    if current_user.cart.cart_items.map { |ci| ci.package }.include?(@package)
      @cart_item = current_user.cart.cart_items.find_by(package_id: @package.id)
      @cart_item.quantity += cart_item_params[:quantity].to_i
      @cart_item.save
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.package = @package
      @cart_item.cart = current_user.cart || Cart.new(user: current_user)
    end
      if @cart_item.save
        redirect_to packages_path
      else
      render 'packages/show'
    end
end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to packages_path }
      format.js
    end
  end

 private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
