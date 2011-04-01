require 'test_helper'

class GroceriesControllerTest < ActionController::TestCase
  setup do
    @menu = menus(:one)
    @grocery = groceries(:one)
  end

  test "should get index" do
    get :index, :menu_id => @menu.id
    assert_response :success
    assert_not_nil assigns(:groceries)
  end

  test "should get new" do
    get :new, :menu_id => @menu.id
    assert_response :success
  end

  test "should create grocery" do
    grocery = Grocery.new
    grocery.ingredient_name = "bananas"

    assert_difference('Grocery.count') do
      post :create, :menu_id => @menu.id, :grocery => grocery.attributes
    end

    assert_redirected_to menu_grocery_path(@menu, assigns(:grocery))
  end

  test "should show grocery" do
    get :show, :menu_id => @menu.id, :id => @grocery.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :menu_id => @menu.id, :id => @grocery.to_param
    assert_response :success
  end

  test "should update grocery" do
    grocery = Grocery.new
    grocery.ingredient_name = "bananas"

    put :update, :menu_id => @menu.id, :id => @grocery.to_param, :grocery => grocery.attributes
    assert_redirected_to menu_grocery_path(@menu, assigns(:grocery))
  end

  test "should destroy grocery" do
    assert_difference('Grocery.count', -1) do
      delete :destroy, :menu_id => @menu.id, :id => @grocery.to_param
    end

    assert_redirected_to menu_groceries_path(@menu)
  end
end
