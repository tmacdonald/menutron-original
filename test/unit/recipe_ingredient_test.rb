require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  setup do
    @recipe = recipes(:one)
  end
  
  test "should use existing measurement and ingredient" do
    recipe_ingredient = @recipe.ingredients.build

    recipe_ingredient.how_much = "1 cup"
    recipe_ingredient.ingredient_name = "blueberries"
    assert recipe_ingredient.save

    assert_equal ingredients(:blueberries).id, recipe_ingredient.ingredient_id
    assert_equal measurements(:cups).id, recipe_ingredient.measurement_id
    assert_equal 1, recipe_ingredient.amount
  end

  test "should create new ingredient" do
    recipe_ingredient = @recipe.ingredients.build
  
    recipe_ingredient.how_much = "1 cup"
    recipe_ingredient.ingredient_name = "raspberries"
    assert recipe_ingredient.save

    raspberries = Ingredient.find_by_name("raspberries")
    assert_not_nil raspberries

    assert_equal raspberries.id, recipe_ingredient.ingredient_id
    assert_equal measurements(:cups).id, recipe_ingredient.measurement_id
    assert_equal 1, recipe_ingredient.amount
  end

  test "should have no measurement" do
    recipe_ingredient = @recipe.ingredients.build
    
    recipe_ingredient.how_much = "1"
    recipe_ingredient.ingredient_name = "watermelon" 
    assert recipe_ingredient.save

    assert_equal ingredients(:watermelon).id, recipe_ingredient.ingredient_id
    assert_nil recipe_ingredient.measurement_id
    assert_equal 1, recipe_ingredient.amount
  end

  test "should have simple fraction" do
    recipe_ingredient = @recipe.ingredients.build
    
    recipe_ingredient.how_much = "1/2"
    recipe_ingredient.ingredient_name = "watermelon"
    assert recipe_ingredient.save

    assert_equal ingredients(:watermelon).id, recipe_ingredient.ingredient_id
    assert_nil recipe_ingredient.measurement_id
    assert_equal 0.5, recipe_ingredient.amount
  end

  test "should have mixed fraction" do
    recipe_ingredient = @recipe.ingredients.build
    
    recipe_ingredient.how_much = "1 1/2"
    recipe_ingredient.ingredient_name = "watermelon"
    assert recipe_ingredient.save

    assert_equal ingredients(:watermelon).id, recipe_ingredient.ingredient_id
    assert_nil recipe_ingredient.measurement_id
    assert_equal 1.5, recipe_ingredient.amount
  end

  test "should have preparation" do
    recipe_ingredient = @recipe.ingredients.build
    
    recipe_ingredient.how_much = "1"
    recipe_ingredient.ingredient_name = "watermelon" 
    recipe_ingredient.preparation = "halved"
    assert recipe_ingredient.save

    assert_equal ingredients(:watermelon).id, recipe_ingredient.ingredient_id
    assert_nil recipe_ingredient.measurement_id
    assert_equal 1, recipe_ingredient.amount
    assert_equal "halved", recipe_ingredient.preparation
  end
end
