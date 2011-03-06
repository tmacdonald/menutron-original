class Meal < ActiveRecord::Base
  has_many :recipes, :class_name => "MenuRecipe", :dependent => :destroy
  has_many :ingredients, :class_name => "MenuIngredient", :dependent => :destroy

  accepts_nested_attributes_for :recipes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
end
