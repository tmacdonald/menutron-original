class RecipeIngredient < ActiveRecord::Base
  default_scope :order => '"order" ASC'
  include Amounted

  belongs_to :ingredient
  belongs_to :measurement
  belongs_to :recipe
end
