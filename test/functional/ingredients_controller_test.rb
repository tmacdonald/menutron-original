require 'test_helper'

class IngredientsControllerTest < ActionController::TestCase
  setup do
    @ingredient = ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredients)
  end

  test "should get index json" do
    get :index, :format => "json"
    assert_response :success
    assert_not_nil assigns(:ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post :create, :ingredient => @ingredient.attributes
    end

    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should create ingredient json" do
    assert_difference('Ingredient.count') do
      post :create, :ingredient => @ingredient.attributes, :format => "json"
    end
  
    assert_response :success
  end

  test "should show ingredient" do
    get :show, :id => @ingredient.to_param
    assert_response :success
  end

  test "should show ingredient json" do
    get :show, :id => @ingredient.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:ingredient)
  end

  test "should get edit" do
    get :edit, :id => @ingredient.to_param
    assert_response :success
  end

  test "should update ingredient" do
    put :update, :id => @ingredient.to_param, :ingredient => @ingredient.attributes
    assert_redirected_to ingredient_path(assigns(:ingredient))
  end

  test "should update ingredient using json" do
    put :update, :id => @ingredient.to_param, :ingredient => @ingredient.attributes, :format => "json"
    assert_response :success
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete :destroy, :id => @ingredient.to_param
    end

    assert_redirected_to ingredients_path
  end

  test "should destroy ingredient using json" do
    assert_difference('Ingredient.count', -1) do
      delete :destroy, :id => @ingredient.to_param, :format => "json"
    end

    assert_response :success
  end
end
