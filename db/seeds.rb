# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."

Food.delete_all
Restaurant.delete_all
Menu.delete_all
User.delete_all
Criteria.delete_all
Rating.delete_all
Preferences.delete_all

# Create the food, we'll create two for character, focus should be on one for MVP
puts "Creating food - but only Bloody Marys matter ..."
bloody = Food.create(category: "Bloody Mary", description: "The breakfast drink of champions! A drink consisting of booze and tomato juice seasoned to perfection.")
hotdog = Food.create(category: "Hot Dog", description: "A delightful encased meat, aka a weiner, a frankfurter, a footlong, served hot in a long, soft roll and topped with various condiments")
burger = Food.create(category: "Hamburger", description: "A delicious beef patty, served on a bun + condiments and delivered hot")
oldfash = Food.create(category: "Old Fashioned", description: "A sophisticated beverage, whisky, soda, bitters, sugar, and ice cubes - hand cra to be enjoyed")

# Create the restaurant, not so important, but we have to be able to find this food somehow, I'd like to be able to get coordinates from google, but we'll come back to that
puts "Creating the restaurants ... " 
firehouse = Restaurant.create(name: "Firehouse Grill", address: "750 Chicago Ave", city: "Evanston", state: "IL", zip: "60202", location: "TBD", genre: "American")
sunda = Restaurant.create(name: "Sunda", address: "110 West Illinois Street", city: "Chicago", state: "IL", zip: "60654", location: "TBD", genre: "Asian")
marianos = Restaurant.create(name: "Mariano's", address: "1800 West Lawrence Avenue", city: "Chicago", state: "IL", zip: "60640", location: "TBD", genre: "Grocery Store")
wickedhop = Restaurant.create(name: "The Wicked Hop", address: "345 North Broadway", city: "Milwaukee", state: "WI", zip: "53202", location: "TBD", genre: "Seafood")
ubdogs = Restaurant.create(name: "U. B. Dogs", address: "185 North Franklin Street", city: "Chicago", state: "IL", zip: "60606", location: "TBD", genre: "American")

# Now let's create the menus, this is just the relationship between restaurants and foods to see what's where
puts "Creating the menus, are you getting hungry? ... "
firehouse_bloody = Menu.create(restaurant_id: firehouse.id, food_id: bloody.id)
sunda_bloody = Menu.create(restaurant_id: sunda.id, food_id: bloody.id)
wicked_bloody = Menu.create(restaurant_id: wickedhop.id, food_id: bloody.id)
ubdogs_dog = Menu.create(restaurant_id: ubdogs.id, food_id: hotdog.id)
marianos_bloody = Menu.create(restaurant_id: marianos.id, food_id: bloody.id)


# Create the users, I supect this will need to change once we get better login data? 
puts "Creating the initial users"
weston = User.create(name: "WestonA", password: "beer", firstname: "Weston", lastname: "Anderson", email: "weston.anderson@gmail.com", twitter: "@W_Seibold")
emily = User.create(name: "EmilyA", password: "cheese", firstname: "Emily", lastname: "Anderson", email: "hoover.emilyi@gmail.com", twitter: "@AndersonEHI")


# Create the criteria, this are important and can be variable by user, but clearly defining criteria is what makes a good framework
puts "Creating the criteria, this is the framework for success ..."
garnishes = Criteria.create(food_id: bloody.id, criteria_desc: "Garnishes", focus: "the stuff that's on top is pretty important", star1: "nothing", star2: "olives and a pickle", star3: "full toothpick", star4: "something special", star5: "the works! an app in a cup")
spice = Criteria.create(food_id: bloody.id, criteria_desc: "Spice", focus: "the kick should have an edge but still be delightful", star1: "not a bloody, this is bad!", star2: "just the mix", star3: "too sweet or too spicy", star4: "just slightly off", star5: "perfect balance of kick")
consistency = Criteria.create(food_id: bloody.id, criteria_desc: "Consistency", focus: "think goldylocks and the porridge", star1: "clamata or way off", star2: "watery", star3: "thick and not refreshing", star4: "just a little off", star5: "just right, refreshing but slightly hearty")
delivery = Criteria.create(food_id: bloody.id, criteria_desc: "Delivery", focus: "The extra touch, everything is better on a mountain top!", star1: "gross", star2: "lacking", star3: "nothing special", star4: "something special", star5: "you really feel special!")

# Create the user preferences, this is how you will rate a food 
puts "Generating user preferences ... "
Preferences.create(user_id: weston.id, food_id: bloody.id, criteria_id_1: garnishes.id, criteria_id_2: spice.id,  criteria_id_3: consistency.id,  criteria_id_4: delivery.id )
Preferences.create(user_id: emily.id, food_id: bloody.id, criteria_id_1: spice.id, criteria_id_2: garnishes.id,  criteria_id_3: consistency.id,  criteria_id_4: delivery.id)

# Create the table of user ratings, this is the real content, I should probably write a bunch of it. 
puts "Creating the ratings, here's the real content in the making ..."

Rating.create(menu_id: sunda_bloody.id, user_id: weston.id, criteria_id: spice.id, rating_stars: 3, comments: "Sweeter than I would prefer", visit_date: "2014-1-25".to_date, rating_date: DateTime.now)
Rating.create(menu_id: sunda_bloody.id, user_id: weston.id, criteria_id: garnishes.id, rating_stars: 5, comments: "Holy Balls this is Amazing!", visit_date: "2014-1-25".to_date, rating_date: DateTime.now)
Rating.create(menu_id: sunda_bloody.id, user_id: weston.id, criteria_id: consistency.id, rating_stars: 5, visit_date: "2014-1-25".to_date, rating_date: DateTime.now)
Rating.create(menu_id: sunda_bloody.id, user_id: weston.id, criteria_id: delivery.id, rating_stars: 5, comments: "I took a picture, and I might frame it", visit_date: "2014-1-25".to_date, rating_date: DateTime.now)

Rating.create(menu_id: sunda_bloody.id, user_id: emily.id, criteria_id: spice.id, rating_stars: 2, comments: "These are supposed to have a kick!", visit_date: "2014-1-25".to_date, rating_date: DateTime.now)
Rating.create(menu_id: sunda_bloody.id, user_id: emily.id, criteria_id: garnishes.id, rating_stars: 5, comments: "Whoa!", visit_date: "2014-1-25".to_date, rating_date: DateTime.now)
Rating.create(menu_id: sunda_bloody.id, user_id: emily.id, criteria_id: consistency.id, rating_stars: 4, comments: "Slightly on the thin side", visit_date: "2014-1-25".to_date, rating_date: DateTime.now)
Rating.create(menu_id: sunda_bloody.id, user_id: emily.id, criteria_id: delivery.id, rating_stars: 3, comments: "it was empty, and no mountains! :(", visit_date: "2014-1-25".to_date, rating_date: DateTime.now)

puts "There are now #{User.count} users, #{Food.count} foods, #{Restaurant.count} restaurants, and #{Rating.count} ratings in the database."



# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
