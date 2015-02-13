class Restaurant < ActiveRecord::Base

  has_many :menus
  has_many :foods, through: :menus

end
