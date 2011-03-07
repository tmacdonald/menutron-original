class Menu < ActiveRecord::Base
  validates_presence_of :name

  has_many :recipes, :class_name => "MenuRecipe", :dependent => :destroy
  has_many :ingredients, :class_name => "MenuIngredient", :dependent => :destroy
  has_many :meals, :dependent => :destroy

  accepts_nested_attributes_for :recipes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :meals, :reject_if => :all_blank, :allow_destroy => true

end
