require 'test_helper'

class RecipeDirectionsControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
    @recipe_direction = recipe_directions(:one)
  end

  test "should get index" do
    get :index, :recipe_id => @recipe.slug
    assert_response :success
    assert_not_nil assigns(:recipe_directions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_direction" do
    assert_difference('RecipeDirection.count') do
      post :create, :recipe_direction => @recipe_direction.attributes
    end

    assert_redirected_to recipe_direction_path(assigns(:recipe_direction))
  end

  test "should show recipe_direction" do
    get :show, :id => @recipe_direction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @recipe_direction.to_param
    assert_response :success
  end

  test "should update recipe_direction" do
    put :update, :id => @recipe_direction.to_param, :recipe_direction => @recipe_direction.attributes
    assert_redirected_to recipe_direction_path(assigns(:recipe_direction))
  end

  test "should destroy recipe_direction" do
    assert_difference('RecipeDirection.count', -1) do
      delete :destroy, :id => @recipe_direction.to_param
    end

    assert_redirected_to recipe_directions_path
  end
end
