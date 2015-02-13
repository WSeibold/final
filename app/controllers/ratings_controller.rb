class RatingsController < ApplicationController


# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
    @ratings = Rating.all
  end

  def show 
  end 
  
  def new
  end

  def create

  #  Rating.create(category: params["category"], description: params["description"])

  end

  def update
  end

  def destroy
  end

end