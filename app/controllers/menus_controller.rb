class MenusController < ApplicationController


# Need to define the variable is in the controller, this method is called the action
# The index is a method in a controller mapping the db to the views 
  def index 
    
  end

  def show
    @place = Menu.find_by(id: params["id"])

    # Find all the menus with the food id in params
    @ratings = Ratings.where(menu_id: params["id"])
    # give me the menus where the food id = param
    @availability = Menu.where(food_id: @food.id)
    # We creat an empty array and then... 
    @spots = [] 
    # ... loop through roles and add them to the array 
    @availability.each do |spot|
      @spots << Restaurant.find_by(id: spot.menu_id)
    end
    
    @ratings = Rating.where(menu_id: @spot.id)

  end 
  
  def new
  end

  def create

    Food.create(category: params["category"], description: params["description"])


  end

  def update
  end

  def destroy
  end
end