class RecipeIngredient < ActiveRecord::Base
  include Amounted

  belongs_to :ingredient
end
