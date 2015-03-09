class RatingsController < ApplicationController
  skip_before_action :require_user


# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
    @ratings = Rating.all
  end

  def show 
  end 
  
  def new
    @rating = Rating.new
    @food = Food.find_by(id: params["movie_id"]
    # Define the food as the what you clicked on 
    @menus = Menu.where(food_id: params["id"])
    # Now give me all the restaurants that have it
    @spots = @menus.restaurants
  end

  def create

  #  Rating.create(category: params["category"], description: params["description"])
    rating_params = params.require(:rating).permit!
    @rating = Rating.create(rating_params)
    if @rating.valid?
      redirect_to ratings_path, notice: "Cool Dude"
    else
      render "new"
    end
  end

  def edit
    @ratings = Rating.find_by(id: params["id"])
  end

  def update
    rating_params = params.require(:ratings).permit!
    @ratings = Rating.find_by(id: params["id"])
    @ratings.update(rating_params)
    redirect_to ratings_path
  end

  def destroy
    @rating = Rating.find_by(id: params["id"])
    @rating.destroy
    redirect_to ratings_path
  end

end
