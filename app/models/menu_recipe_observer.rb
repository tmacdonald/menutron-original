class MenuRecipeObserver < ActiveRecord::Observer
  def before_save(model)
    model.recipe.ingredients.each do |i|
      grocery = Grocery.new
      grocery.menu_id = model.menu_id
      grocery.menu_recipe_id = model.id
      grocery.how_much = i.how_much
      grocery.ingredient_name = i.ingredient_name
      model.groceries.push grocery
    end
  end
end
