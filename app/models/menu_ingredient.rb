class MenuIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measurement
  belongs_to :menu
  belongs_to :meal
  has_one :grocery
end
