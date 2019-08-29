class CartItemsController < ApplicationController

  # def show
  #   @package = Package.find(params[:package_id])
  #   @cart_item = Cart_item.new
  #   @cart_item.package = @package
  # end

  def create
    @package = Package.find(params[:package_id])
    raise
    if current_user.cart.cart_items.map { |ci| ci.package }.include? (@package)
    # current_user.cart.cart_items.map { |ci| ci.package }.include? @package
    # current_user.cart.cart_items.map(&:package).include? @package
    # tu regardes si ton user a des cart items
    # if current_user.cart.cart_items.any?
    #   # s'il en a tu iteres dessus et tu regardes pour chacun si le package id du cart item est le meme
    #   current_user.cart.cart_items.each do |cart_item|
    #     if cart_item.package == @package
          # que @package
          # si jamais il existe deja, tu chopes le cart item et le update avec params quantty
          ci.quantity += cart_item_params[:quantity].to_i
          ci.save
          # si il existe pas
        else
          # sil en a pas tu fais ton truc ci dessous
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
    redirect_to packages_path
  end

 private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
