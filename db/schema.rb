# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "criteria", force: :cascade do |t|
    t.integer "food_id"
    t.string  "criteria_desc"
    t.text    "focus"
    t.string  "star1"
    t.string  "star2"
    t.string  "star3"
    t.string  "star4"
    t.string  "star5"
  end

  add_index "criteria", ["food_id"], name: "index_criteria_on_food_id"

  create_table "foods", force: :cascade do |t|
    t.string "category"
    t.text   "description"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "food_id"
  end

  add_index "menus", ["food_id"], name: "index_menus_on_food_id"
  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id"

  create_table "preferences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "food_id"
    t.integer "criteria_id_1"
    t.integer "criteria_id_2"
    t.integer "criteria_id_3"
    t.integer "criteria_id_4"
    t.integer "criteria_id_5"
  end

  add_index "preferences", ["food_id"], name: "index_preferences_on_food_id"
  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "food_id"
    t.integer  "user_id"
    t.integer  "rating_stars"
    t.text     "comments"
    t.date     "visit_date"
    t.datetime "rating_date"
    t.integer  "criteria_id"
  end

  add_index "ratings", ["criteria_id"], name: "index_ratings_on_criteria_id"
  add_index "ratings", ["food_id"], name: "index_ratings_on_food_id"
  add_index "ratings", ["restaurant_id"], name: "index_ratings_on_restaurant_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "location"
    t.string "genre"
    t.string "hours"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "twitter"
  end

end
