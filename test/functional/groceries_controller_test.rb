require 'test_helper'

class GroceriesControllerTest < ActionController::TestCase
  setup do
    @grocery = groceries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groceries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grocery" do
    assert_difference('Grocery.count') do
      post :create, :grocery => @grocery.attributes
    end

    assert_redirected_to grocery_path(assigns(:grocery))
  end

  test "should show grocery" do
    get :show, :id => @grocery.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @grocery.to_param
    assert_response :success
  end

  test "should update grocery" do
    put :update, :id => @grocery.to_param, :grocery => @grocery.attributes
    assert_redirected_to grocery_path(assigns(:grocery))
  end

  test "should destroy grocery" do
    assert_difference('Grocery.count', -1) do
      delete :destroy, :id => @grocery.to_param
    end

    assert_redirected_to groceries_path
  end
end
