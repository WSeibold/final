class RestaurantsController < ApplicationController


# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
  # What's in between the def & the end is all the work
    @restaurants = Restaurant.all
  end

  def show
  end 
  
  def new
    @rest = Restaurant.new
  end

  def create
    rest_params = params.require(:restaurant).permit!
    @rest = Restaurant.create(rest_params)
    if @rest.valid?
      redirect_to restaurants_path, notice: "Cool Dude"
    else
      render "new", notice: "Sorry, it didn't save"
    end
  end

  def edit
    @rest = Restaurant.find_by(id: params["id"])
  end

  def update
    rest_params = params.require(:restaurant).permit!
    @rest = Restaurant.find_by(id: params["id"])
    @rest.update(rest_params)
    if @rest.valid?
      redirect_to restaurants_path, notice: @rest.name+" has been updated"
    else
      render "edit", notice: "Sorry, it didn't save"
    end
  end

  def destroy
    # this will need to be a complex link thing
  end
end