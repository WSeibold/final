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
   
    rating_params = params.require(:rating).permit!
    @rating = Rating.create(rating_params)
#   try to find the menu id that is for the selected restaurant
    @rating.user = current_user
    if @rating.save
      redirect_to foods_path notice: "Thanks for the review!"
    else
      render "new"
    end

  end


end
