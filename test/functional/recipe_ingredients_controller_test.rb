require 'test_helper'

class RecipeIngredientsControllerTest < ActionController::TestCase
  setup do
    @recipe_ingredient = recipe_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_ingredient" do
    assert_difference('RecipeIngredient.count') do
      post :create, :recipe_ingredient => @recipe_ingredient.attributes
    end

    assert_redirected_to recipe_ingredient_path(assigns(:recipe_ingredient))
  end

  test "should show recipe_ingredient" do
    get :show, :id => @recipe_ingredient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @recipe_ingredient.to_param
    assert_response :success
  end

  test "should update recipe_ingredient" do
    put :update, :id => @recipe_ingredient.to_param, :recipe_ingredient => @recipe_ingredient.attributes
    assert_redirected_to recipe_ingredient_path(assigns(:recipe_ingredient))
  end

  test "should destroy recipe_ingredient" do
    assert_difference('RecipeIngredient.count', -1) do
      delete :destroy, :id => @recipe_ingredient.to_param
    end

    assert_redirected_to recipe_ingredients_path
  end
end
