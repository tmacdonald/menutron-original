require 'test_helper'

class MenuIngredientsControllerTest < ActionController::TestCase
  setup do
    @menu = menus(:one)
    @menu_ingredient = menu_ingredients(:one)
    UserSession.create(users(:one))
  end

  test "should get index" do
    get :index, :menu_id => @menu.id
    assert_response :success
    assert_not_nil assigns(:menu_ingredients)
  end

  test "should get new" do
    get :new, :menu_id => @menu.id
    assert_response :success
  end

  test "should create menu_ingredient" do
    assert_difference('MenuIngredient.count') do
      post :create, :menu_id => @menu.id, :menu_ingredient => { :ingredient_name => "bananas" }
    end

    assert_redirected_to menu_menu_ingredient_path(@menu, assigns(:menu_ingredient))
  end

  test "should show menu_ingredient" do
    get :show, :menu_id => @menu.id, :id => @menu_ingredient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :menu_id => @menu.id, :id => @menu_ingredient.to_param
    assert_response :success
  end

  test "should update menu_ingredient" do
    @menu_ingredient.ingredient_name = "bananas"

    put :update, :menu_id => @menu.to_param, :id => @menu_ingredient.to_param, :menu_ingredient => @menu_ingredient.attributes
    assert_redirected_to menu_menu_ingredient_path(@menu, assigns(:menu_ingredient))
  end

  test "should destroy menu_ingredient" do
    assert_difference('MenuIngredient.count', -1) do
      delete :destroy, :menu_id => @menu.id, :id => @menu_ingredient.to_param
    end

    assert_redirected_to menu_menu_ingredients_path(@menu)
  end

  test "should get index using json" do
    get :index, :menu_id => @menu.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:menu_ingredients)
  end

  test "should create menu_ingredient using json" do
    @menu_ingredient.ingredient_name = "bananas"

    assert_difference('MenuIngredient.count') do
      post :create, :menu_id => @menu.to_param, :menu_ingredient => @menu_ingredient.attributes, :format => "json"
    end

    assert_response :success
    assert_not_nil assigns(:menu_ingredient)
  end

  test "should show menu_ingredient using json" do
    get :show, :menu_id => @menu.to_param, :id => @menu_ingredient.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:menu_ingredient)
 end

  test "should update menu_ingredient using json" do
    @menu_ingredient.ingredient_name = "bananas"

    put :update, :menu_id => @menu.to_param, :id => @menu_ingredient.to_param, :menu_ingredient=> @menu_ingredient.attributes, :format => "json"
    assert_response :success
    assert_not_nil assigns(:menu_ingredient)
  end

  test "should destroy menu_ingredient using json" do
    assert_difference('MenuIngredient.count', -1) do
      delete :destroy, :menu_id => @menu.to_param, :id => @menu_ingredient.to_param, :format => "json"
    end

    assert_response :success
  end
end
