require 'test_helper'

class MenuIngredientsControllerTest < ActionController::TestCase
  setup do
    @menu = menus(:one)
    @menu_ingredient = menu_ingredients(:one)
  end

  test "should get index" do
    get :index, :menu_id => @menu.id, :format => "json"
    assert_response :success
    assert_not_nil assigns(:menu_ingredients)
  end

  test "should get new" do
    get :new, :menu_id => @menu.id
    assert_response :success
  end

  test "should create menu_ingredient" do
    menu_ingredient = MenuIngredient.new
    menu_ingredient.ingredient_name = "bananas"
  
    assert_difference('MenuIngredient.count') do
      post :create, :menu_id => @menu.id, :menu_ingredient => menu_ingredient.attributes, :format => "json"
    end

    assert_response :success
  end

  test "should show menu_ingredient" do
    get :show, :menu_id => @menu.id, :id => @menu_ingredient.to_param, :format => "json"
    assert_response :success
  end

  test "should get edit" do
    get :edit, :menu_id => @menu.id, :id => @menu_ingredient.to_param
    assert_response :success
  end

  test "should update menu_ingredient" do
    @menu_ingredient.ingredient_name = "bananas"

    put :update, :menu_id => @menu.to_param, :id => @menu_ingredient.to_param, :menu_ingredient => @menu_ingredient.attributes, :format => "json"
    assert_response :success
  end

  test "should destroy menu_ingredient" do
    assert_difference('MenuIngredient.count', -1) do
      delete :destroy, :menu_id => @menu.id, :id => @menu_ingredient.to_param, :format => "json"
    end

    assert_response :success
  end
end
