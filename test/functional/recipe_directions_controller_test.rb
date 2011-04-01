require 'test_helper'

class RecipeDirectionsControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
    @recipe_direction = recipe_directions(:one)
  end

  test "should get index" do
    get :index, :recipe_id => @recipe.to_param
    assert_response :success
    assert_not_nil assigns(:recipe_directions)
  end

  test "should get new" do
    get :new, :recipe_id => @recipe.to_param
    assert_response :success
  end

  test "should create recipe_direction" do
    assert_difference('RecipeDirection.count') do
      post :create, :recipe_id => @recipe.to_param, :recipe_direction => @recipe_direction.attributes
    end

    assert_redirected_to recipe_recipe_direction_path(@recipe, assigns(:recipe_direction))
  end

  test "should show recipe_direction" do
    get :show, :recipe_id => @recipe.to_param, :id => @recipe_direction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :recipe_id => @recipe.to_param, :id => @recipe_direction.to_param
    assert_response :success
  end

  test "should update recipe_direction" do
    put :update, :recipe_id => @recipe.to_param, :id => @recipe_direction.to_param, :recipe_direction => @recipe_direction.attributes
    assert_redirected_to recipe_recipe_direction_path(@recipe, assigns(:recipe_direction))
  end

  test "should destroy recipe_direction" do
    assert_difference('RecipeDirection.count', -1) do
      delete :destroy, :recipe_id => @recipe.to_param, :id => @recipe_direction.to_param
    end

    assert_redirected_to recipe_recipe_directions_path(@recipe)
  end
end
