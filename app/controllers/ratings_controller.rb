class RatingsController < ApplicationController


# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
    @ratings = Rating.all
  end

  def show 
  end 
  
  def new
    @rating = Rating.new

  end

  def create

  #  Rating.create(category: params["category"], description: params["description"])
    rating_params = 
      params.require(:menu_id)
      params.require(:criteria_id)
      params.require(:user_id)
      params.require(:rating_stars)
      params.permit(:comments)
      params.permit(:visit_date)
      params.permit(:rating_date)
    Rating.create(rating_params)
    redirect_to ratings_path
  end

  def edit
    @rating = Rating.find_by(id: params["id"])
  end

  def update
    rating_params = 
      params.permit(:rating_stars)
      params.permit(:comments)
      params.permit(:visit_date)
    @rating = Rating.find_by(id: params["id"])
    @rating.update(rating_params)
    redirect_to ratings_path
  end

  def destroy
    @rating = Rating.find_by(id: params["id"])
    @rating.destroy
    redirect_to ratings_path
  end

end
