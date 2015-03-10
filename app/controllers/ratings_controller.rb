class RatingsController < ApplicationController
  skip_before_action :require_user

  def new
    # get my food
    @food = Food.find_by(id: params["food_id"])
    @rating = Rating.new
  end

  def create
    @food = Food.find_by(id: params["movie_id"])
    rating_params = params.require(:rating).permit!
    @rating = @food.ratings.new(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to @food, notice: "Thanks for rating!"
    else
      render "new"
    end
  end


end
