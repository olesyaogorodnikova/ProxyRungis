class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    redirect_to restaurants_path
  end

  def show
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :delivery_start_hour, :delivery_end_hour, :email, :password, :created_at, :updated_at)
  end
end
