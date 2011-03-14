class MenuRecipe < ActiveRecord::Base
  belongs_to :menu
  belongs_to :recipe
  has_many :groceries

  after_save :copy_to_groceries
  
  def copy_to_groceries
    self.recipe.ingredients.each do |i|
      grocery = Grocery.new
      grocery.menu_id = self.menu_id
      grocery.menu_recipe_id = self.id
      grocery.how_much = i.how_much
      grocery.ingredient_name = i.ingredient_name
      grocery.save
    end
  end
end
