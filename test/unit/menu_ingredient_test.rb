require 'test_helper'

class MenuIngredientTest < ActiveSupport::TestCase
  setup do
    @menu = menus(:one)
  end
  
  test "should create menu ingredient using existing measurement and ingredient" do
    menu_ingredient = @menu.ingredients.build

    menu_ingredient.how_much = "1 cup"
    menu_ingredient.ingredient_name = "blueberries"
    assert menu_ingredient.save

    assert_equal ingredients(:blueberries).id, menu_ingredient.ingredient_id
    assert_equal measurements(:cups).id, menu_ingredient.measurement_id
    assert_equal 1, menu_ingredient.amount
  end

  test "should create menu ingredient with new ingredient" do
    menu_ingredient = @menu.ingredients.build
  
    menu_ingredient.how_much = "1 cup"
    menu_ingredient.ingredient_name = "raspberries"
    assert menu_ingredient.save

    raspberries = Ingredient.find_by_name("raspberries")
    assert_not_nil raspberries

    assert_equal raspberries.id, menu_ingredient.ingredient_id
    assert_equal measurements(:cups).id, menu_ingredient.measurement_id
    assert_equal 1, menu_ingredient.amount
  end

  test "should create menu ingredient with no measurement" do
    menu_ingredient = @menu.ingredients.build
    
    menu_ingredient.how_much = "1"
    menu_ingredient.ingredient_name = "watermelon" 
    assert menu_ingredient.save

    assert_equal ingredients(:watermelon).id, menu_ingredient.ingredient_id
    assert_nil menu_ingredient.measurement_id
    assert_equal 1, menu_ingredient.amount
  end

  test "should create menu ingredient with simple fraction" do
    menu_ingredient = @menu.ingredients.build
    
    menu_ingredient.how_much = "1/2"
    menu_ingredient.ingredient_name = "watermelon"
    assert menu_ingredient.save

    assert_equal ingredients(:watermelon).id, menu_ingredient.ingredient_id
    assert_nil menu_ingredient.measurement_id
    assert_equal 0.5, menu_ingredient.amount
  end

  test "should create menu ingredient with mixed fraction" do
    menu_ingredient = @menu.ingredients.build
    
    menu_ingredient.how_much = "1 1/2"
    menu_ingredient.ingredient_name = "watermelon"
    assert menu_ingredient.save

    assert_equal ingredients(:watermelon).id, menu_ingredient.ingredient_id
    assert_nil menu_ingredient.measurement_id
    assert_equal 1.5, menu_ingredient.amount
  end

  test "should create menu ingredient with preparation" do
    menu_ingredient = @menu.ingredients.build
    
    menu_ingredient.how_much = "1"
    menu_ingredient.ingredient_name = "watermelon" 
    menu_ingredient.preparation = "halved"
    assert menu_ingredient.save

    assert_equal ingredients(:watermelon).id, menu_ingredient.ingredient_id
    assert_nil menu_ingredient.measurement_id
    assert_equal 1, menu_ingredient.amount
    assert_equal "halved", menu_ingredient.preparation
  end
end
