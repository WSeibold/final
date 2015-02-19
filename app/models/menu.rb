class Menu < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :food
  has_many :ratings
  # has_many :criteria, through: :foods  

end
