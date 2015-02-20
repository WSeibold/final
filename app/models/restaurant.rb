class Restaurant < ActiveRecord::Base

  has_many :menus
  # short circuit the join model to get rid of the menus in the middle so you don't need to loop through
  has_many :foods, :through => :menus

end
