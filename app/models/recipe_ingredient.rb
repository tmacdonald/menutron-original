class RecipeIngredient < ActiveRecord::Base
  default_scope :order => '"order" ASC'
  include Amounted

  belongs_to :ingredient
end
