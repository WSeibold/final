class FoodsController < ApplicationController

# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
  # What's in between the def & the end is all the work
    @foods = Food.all
  end

  def show
    # Define the food as the what you clicked on 
    @food = Food.find_by(id: params["id"])
    # Now give me all the restaurants that have it
    @spots = @food.menus

    # @food = Food.find_by(id: params["id"])
    # # give me the roles where the movie id = param
    # @availability = Menu.where(food_id: @food.id)
    # # We create an empty array and then... 
    # @spots = [] 
    # # ... loop through menus and add them to the array 
    # @availability.each do |spot|
    #   @spots << Restaurant.find_by(id: spot.restaurant_id)
    #end
  end 
  
  def new
    @food = Food.new
  end

  def create
    food_params = params.require(:food).permit(:category, :description)
    @food = Food.create(food_params)
    if @food.save
       redirect_to foods_path
     else
       render "fail"
    end
  end

  def edit
    @food = Food.find_by(id: params["id"])
  end

  def update
    food_params = params.require(:food).permit(:category, :description)
    @food = Food.find_by(id: params["id"])
    @food.update(food_params)
    redirect_to foods_path
  end

  def destroy
    @food = Food.find_by(id: params["id"])
    @food.destroy
    redirect_to foods_path
  end
end