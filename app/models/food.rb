class Food < ActiveRecord::Base

  has_many :menus
  has_many :restaurants, :through => :menus
#  has_many :criteria
#  has_many :ratings, :through => :menus
  
end
