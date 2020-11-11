class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @review = Review.new(strong_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant.id)
  end

  private

  def strong_params
    params.require(:review).permit(:rating, :content)
  end

end
