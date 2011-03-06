class Meal < ActiveRecord::Base
  has_many :recipes, :class_name => "MenuRecipe", :dependent => :destroy

  accepts_nested_attributes_for :recipes, :reject_if => :all_blank, :allow_destroy => true
end
