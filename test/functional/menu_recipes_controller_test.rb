require 'test_helper'

class MenuRecipesControllerTest < ActionController::TestCase
  setup do
    @menu = menus(:one)
    @menu_recipe = menu_recipes(:one)
    UserSession.create(users(:one))
  end

  test "should get index" do
    get :index, :menu_id => @menu.to_param
    assert_response :success
    assert_not_nil assigns(:menu_recipes)
  end

  test "should get new" do
    get :new, :menu_id => @menu.to_param
    assert_response :success
  end

  test "should create menu_recipe" do
    menu_recipe = MenuRecipe.new
    menu_recipe.menu = @menu
    menu_recipe.recipe = recipes(:one)
  
    assert_difference('MenuRecipe.count') do
      post :create, :menu_id => @menu.to_param, :menu_recipe => menu_recipe.attributes
    end

    assert_redirected_to menu_menu_recipe_path(@menu, assigns(:menu_recipe))
  end

  test "should show menu_recipe" do
    get :show, :menu_id => @menu.to_param, :id => @menu_recipe.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :menu_id => @menu.to_param, :id => @menu_recipe.to_param
    assert_response :success
  end

  test "should update menu_recipe" do
    menu_recipe = MenuRecipe.new
    menu_recipe.menu = @menu
    menu_recipe.recipe = recipes(:one)
    menu_recipe.save

    put :update, :menu_id => @menu.to_param, :id => @menu_recipe.to_param, :menu_recipe => menu_recipe.attributes
    assert_redirected_to menu_menu_recipe_path(@menu, assigns(:menu_recipe))
  end

  test "should destroy menu_recipe" do
    assert_difference('MenuRecipe.count', -1) do
      delete :destroy, :menu_id => @menu.to_param, :id => @menu_recipe.to_param
    end

    assert_redirected_to menu_menu_recipes_path(@menu)
  end

  test "should get index using json" do
    get :index, :menu_id => @menu.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:menu_recipes)
  end

  test "should create menu_recipe using json" do
    menu_recipe = MenuRecipe.new
    menu_recipe.menu = @menu
    menu_recipe.recipe = recipes(:one)

    assert_difference('MenuRecipe.count') do
      post :create, :menu_id => @menu.to_param, :menu_recipe => menu_recipe.attributes, :format => "json"
    end

    assert_response :success
    assert_not_nil assigns(:menu_recipe)
  end

  test "should show menu_recipe using json" do
    get :show, :menu_id => @menu.to_param, :id => @menu_recipe.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:menu_recipe)
 end

  test "should update menu_recipe using json" do
    menu_recipe = MenuRecipe.new
    menu_recipe.menu = @menu
    menu_recipe.recipe = recipes(:one)
    menu_recipe.save

    put :update, :menu_id => @menu.to_param, :id => menu_recipe.to_param, :menu_recipe=> menu_recipe.attributes, :format => "json"
    assert_response :success
    assert_not_nil assigns(:menu_recipe)
  end

  test "should destroy menu_recipe using json" do
    assert_difference('MenuRecipe.count', -1) do
      delete :destroy, :menu_id => @menu.to_param, :id => @menu_recipe.to_param, :format => "json"
    end

    assert_response :success
  end
end
