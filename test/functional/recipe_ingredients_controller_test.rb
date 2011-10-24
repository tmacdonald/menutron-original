require 'test_helper'

class RecipeIngredientsControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
    @recipe_ingredient = recipe_ingredients(:one_cup_flour)
    UserSession.create(users(:one))
  end

  test "should get index" do
    get :index, :recipe_id => @recipe.to_param
    assert_response :success
    assert_not_nil assigns(:recipe_ingredients)
  end

  test "should get new" do
    get :new, :recipe_id => @recipe.to_param
    assert_response :success
  end

  test "should create recipe_ingredient" do
    @recipe_ingredient.ingredient_name = "bananas"

    assert_difference('RecipeIngredient.count') do
      post :create, :recipe_id => @recipe.to_param, :recipe_ingredient => @recipe_ingredient.attributes
    end

    assert_redirected_to recipe_recipe_ingredient_path(@recipe, assigns(:recipe_ingredient))
  end

  test "should show recipe_ingredient" do
    get :show, :recipe_id => @recipe.to_param, :id => @recipe_ingredient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :recipe_id => @recipe.to_param, :id => @recipe_ingredient.to_param
    assert_response :success
  end

  test "should update recipe_ingredient" do
    @recipe_ingredient.ingredient_name = "bananas"

    put :update, :recipe_id => @recipe.to_param, :id => @recipe_ingredient.to_param, :recipe_ingredient => @recipe_ingredient.attributes
    assert_redirected_to recipe_recipe_ingredient_path(@recipe, assigns(:recipe_ingredient))
  end

  test "should destroy recipe_ingredient" do
    assert_difference('RecipeIngredient.count', -1) do
      delete :destroy, :recipe_id => @recipe.to_param, :id => @recipe_ingredient.to_param
    end

    assert_redirected_to recipe_recipe_ingredients_path(@recipe)
  end

  test "should get index using json" do
    get :index, :recipe_id => @recipe.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:recipe_ingredients)
  end

  test "should create recipe_ingredient using json" do
    @recipe_ingredient.ingredient_name = "bananas"

    assert_difference('RecipeIngredient.count') do
      post :create, :recipe_id => @recipe.to_param, :recipe_ingredient => @recipe_ingredient.attributes, :format => "json"
    end

    assert_response :success
    assert_not_nil assigns(:recipe_ingredient)
  end

  test "should show recipe_ingredient using json" do
    get :show, :recipe_id => @recipe.to_param, :id => @recipe_ingredient.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:recipe_ingredient)
 end

  test "should update recipe_ingredient using json" do
    @recipe_ingredient.ingredient_name = "bananas"

    put :update, :recipe_id => @recipe.to_param, :id => @recipe_ingredient.to_param, :recipe_ingredient=> @recipe_ingredient.attributes, :format => "json"
    assert_response :success
    assert_not_nil assigns(:recipe_ingredient)
  end

  test "should destroy recipe_ingredient using json" do
    assert_difference('RecipeIngredient.count', -1) do
      delete :destroy, :recipe_id => @recipe.to_param, :id => @recipe_ingredient.to_param, :format => "json"
    end

    assert_response :success
  end
end
