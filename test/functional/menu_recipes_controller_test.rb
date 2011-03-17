require 'test_helper'

class MenuRecipesControllerTest < ActionController::TestCase
  setup do
    @menu_recipe = menu_recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_recipe" do
    assert_difference('MenuRecipe.count') do
      post :create, :menu_recipe => @menu_recipe.attributes
    end

    assert_redirected_to menu_recipe_path(assigns(:menu_recipe))
  end

  test "should show menu_recipe" do
    get :show, :id => @menu_recipe.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @menu_recipe.to_param
    assert_response :success
  end

  test "should update menu_recipe" do
    put :update, :id => @menu_recipe.to_param, :menu_recipe => @menu_recipe.attributes
    assert_redirected_to menu_recipe_path(assigns(:menu_recipe))
  end

  test "should destroy menu_recipe" do
    assert_difference('MenuRecipe.count', -1) do
      delete :destroy, :id => @menu_recipe.to_param
    end

    assert_redirected_to menu_recipes_path
  end
end
