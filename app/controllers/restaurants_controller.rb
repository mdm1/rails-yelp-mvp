class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create!(strong_params)
    redirect_to restaurant_path(@restaurant.id)
  end

  # def edit
  # end

  def show
    @restaurant = find_restaurant
    @reviews = @restaurant.reviews
  end

  # def update
  # end

  # def destroy
  # end

  private

  def strong_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
