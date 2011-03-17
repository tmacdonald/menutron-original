require 'test_helper'

class MenuIngredientsControllerTest < ActionController::TestCase
  setup do
    @menu_ingredient = menu_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_ingredient" do
    assert_difference('MenuIngredient.count') do
      post :create, :menu_ingredient => @menu_ingredient.attributes
    end

    assert_redirected_to menu_ingredient_path(assigns(:menu_ingredient))
  end

  test "should show menu_ingredient" do
    get :show, :id => @menu_ingredient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @menu_ingredient.to_param
    assert_response :success
  end

  test "should update menu_ingredient" do
    put :update, :id => @menu_ingredient.to_param, :menu_ingredient => @menu_ingredient.attributes
    assert_redirected_to menu_ingredient_path(assigns(:menu_ingredient))
  end

  test "should destroy menu_ingredient" do
    assert_difference('MenuIngredient.count', -1) do
      delete :destroy, :id => @menu_ingredient.to_param
    end

    assert_redirected_to menu_ingredients_path
  end
end
