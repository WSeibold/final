class RatingsController < ApplicationController
  skip_before_action :require_user

  def new
    # get my food
    @food = Food.find_by(id: params["food_id"])
    @spots = @food.restaurants
    @rating = Rating.new
    
  end

  def create
    @food = Food.find_by(id: params["food_id"])
    @spots = @food.menus
    
    rating_params = params.require(:rating).permit!
    @rating = @food.rating.new(rating_params)
#   try to find the menu id that is for the selected restaurant
    @rating.menu_id = @menus.find_by(restaurant) 
    @rating.user = current_user
    if @rating.save
      redirect_to @food, notice: "Thanks for the review!"
    else
      render "new"
    end

  end


end
