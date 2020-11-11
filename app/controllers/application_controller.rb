class ApplicationController < ActionController::Base

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
