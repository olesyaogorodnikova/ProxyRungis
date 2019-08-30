class CartsController < ApplicationController

  def new
    @user = current_user
    @cart = Cart.new
  end

  def show
    @user = current_user
    @cart = current_user.cart
    @cart_items = current_user.cart.cart_items
    #params[:cart][:cart_items_id].reject(&:blank?).each do |cart|
    #   @cart = Cart.create(user: user_id, cart_items: @cart_items)
    #   flash.keep[:error] = "#{@cart.errors.full_messages.join(' ')}" unless @cart.valid?
    # end
    # redirect_to packages_path
  end

 private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end

  # def new
  #   @plant = Plant.find(params[:plant_id])
  #   @plant_tag = PlantTag.new
  # end

#   def create
#     @plant = Plant.find(params[:plant_id])
#     params[:plant_tag][:tag_id].reject(&:blank?).each do |tag_id|
#       @plant_tag = PlantTag.create(tag_id: tag_id, plant: @plant)
#       flash.keep[:error] = "#{@plant_tag.errors.full_messages.join(' ')}" unless @plant_tag.valid?
#     end
#     redirect_to garden_path(@plant.garden)
#   end

#   private

#   def plant_tag_params
#     params.require(:plant_tag).permit(:tag_id)
#   end
# end
