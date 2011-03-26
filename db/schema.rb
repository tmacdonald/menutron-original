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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110317151453) do

  create_table "groceries", :force => true do |t|
    t.integer  "menu_id"
    t.integer  "menu_ingredient_id"
    t.integer  "menu_recipe_id"
    t.float    "amount"
    t.integer  "measurement_id"
    t.integer  "ingredient_id"
    t.string   "amount_format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "plural",     :default => false
  end

  create_table "meals", :force => true do |t|
    t.string   "name"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", :force => true do |t|
    t.string   "name"
    t.string   "regex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_ingredients", :force => true do |t|
    t.integer  "ingredient_id"
    t.integer  "measurement_id"
    t.integer  "menu_id"
    t.integer  "meal_id"
    t.float    "amount"
    t.string   "amount_format"
    t.string   "preparation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_recipes", :force => true do |t|
    t.integer  "menu_id"
    t.integer  "recipe_id"
    t.integer  "servings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meal_id"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.string   "description", :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "recipe_directions", :force => true do |t|
    t.text     "text"
    t.integer  "order"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", :force => true do |t|
    t.integer  "ingredient_id"
    t.integer  "measurement_id"
    t.integer  "recipe_id"
    t.float    "amount"
    t.string   "amount_format"
    t.string   "preparation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "servings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
