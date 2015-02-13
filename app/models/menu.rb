class Menu < ActiveRecord::Base

  attr_accessible :restaurant_id, :food_id
  has_many :ratings
  belongs_to :restaurant
  belongs_to :food
  
end
