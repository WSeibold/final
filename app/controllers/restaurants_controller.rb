class RestauantsController < ApplicationController


# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
  # What's in between the def & the end is all the work
    @restaurants = Restaurant.all
  end

  def show
  end 
  
  def new
    @restaurants = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find_by(id: params["id"])
  end
    
  def create
    # You have to tell the create what to do
    # Rails has secruity thing so you can't just do  Actor.create(params["actor"])
    # You need this permission for any field
    actor_params = params.require(:actor).permit(:name)
    Actor.create(actor_params)
    redirect_to actors_path
  end

  def update
  end

  def destroy
  end
end