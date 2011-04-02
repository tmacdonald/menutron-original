class MenuIngredientObserver < ActiveRecord::Observer
  def before_save(model)
    grocery = Grocery.new
    grocery.menu_id = model.menu_id
    grocery.menu_ingredient_id = model.id
    grocery.how_much = model.how_much
    grocery.ingredient_name = model.ingredient_name
    model.grocery = grocery
  end
end
