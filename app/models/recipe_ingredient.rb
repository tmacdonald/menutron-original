class RecipeIngredient < ActiveRecord::Base
  include Amounted

  belongs_to :ingredient

  #before_save :parse_virtual_attributes
  #after_find :populate_virtual_attributes
end
