class Grocery < ActiveRecord::Base
  include Amounted

  belongs_to :menu
  belongs_to :menu_ingredient
  belongs_to :menu_recipe
end
