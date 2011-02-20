class Recipe < ActiveRecord::Base
	validates_presence_of :name, :servings

	has_many :directions, :class_name => "RecipeDirection", :dependent => :destroy
	has_many :ingredients, :class_name => "RecipeIngredient", :dependent => :destroy

	accepts_nested_attributes_for :directions, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
end
