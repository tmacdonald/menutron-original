class Grocery < ActiveRecord::Base
  belongs_to :menu
  belongs_to :menu_ingredient
  belongs_to :menu_recipe
  belongs_to :measurement
  belongs_to :ingredient
end
