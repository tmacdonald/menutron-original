require 'test_helper'

class GroceryTest < ActiveSupport::TestCase
  setup do
    @menu = menus(:one)
  end
  
  test "should create grocery using existing measurement and ingredient" do
    grocery = @menu.groceries.build

    grocery.how_much = "1 cup"
    grocery.ingredient_name = "blueberries"
    assert grocery.save

    assert_equal ingredients(:blueberries).id, grocery.ingredient_id
    assert_equal measurements(:cups).id, grocery.measurement_id
    assert_equal 1, grocery.amount
  end

  test "should create grocery with new ingredient" do
    grocery = @menu.groceries.build
  
    grocery.how_much = "1 cup"
    grocery.ingredient_name = "raspberries"
    assert grocery.save

    raspberries = Ingredient.find_by_name("raspberries")
    assert_not_nil raspberries

    assert_equal raspberries.id, grocery.ingredient_id
    assert_equal measurements(:cups).id, grocery.measurement_id
    assert_equal 1, grocery.amount
  end

  test "should create grocery with no measurement" do
    grocery = @menu.groceries.build
    
    grocery.how_much = "1"
    grocery.ingredient_name = "watermelon" 
    assert grocery.save

    assert_equal ingredients(:watermelon).id, grocery.ingredient_id
    assert_nil grocery.measurement_id
    assert_equal 1, grocery.amount
  end

  test "should create grocery with simple fraction" do
    grocery = @menu.groceries.build
    
    grocery.how_much = "1/2"
    grocery.ingredient_name = "watermelon"
    assert grocery.save

    assert_equal ingredients(:watermelon).id, grocery.ingredient_id
    assert_nil grocery.measurement_id
    assert_equal 0.5, grocery.amount
  end

  test "should create grocery with mixed fraction" do
    grocery = @menu.groceries.build
    
    grocery.how_much = "1 1/2"
    grocery.ingredient_name = "watermelon"
    assert grocery.save

    assert_equal ingredients(:watermelon).id, grocery.ingredient_id
    assert_nil grocery.measurement_id
    assert_equal 1.5, grocery.amount
  end
end
