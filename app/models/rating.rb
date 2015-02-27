class Rating < ActiveRecord::Base

  belongs_to :menu
  
  validates_numericality_of :rating_stars, :only_integer => true, :allow_nil => true, :less_than_or_equal_to => 5,
        :message => "can only be whole number between 1 and 5."
  validates :menu_id, presence: true

end
