class FoodsController < ApplicationController

# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
  # What's in between the def & the end is all the work
    @foods = Food.all
  end

  def show
    @food = Food.find_by(id: params["id"])
    # give me the roles where the movie id = param
    @availability = Menu.where(food_id: @food.id)
    # We creat an empty array and then... 
    @spots = [] 
    # ... loop through roles and add them to the array 
    @availability.each do |spot|
      @spots << Restaurant.find_by(id: spot.restaurant_id)
    end
  end 
  
  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end