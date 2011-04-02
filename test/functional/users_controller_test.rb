require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do

    assert_difference('User.count') do
      post :create, :user => { :username => "ben", :password => "benrocks", :password_confirmation => "benrocks", :email => "ben@email.com" }
    end

    assert_redirected_to account_path
  end

  test "should show user" do
    UserSession.create(users(:one))
    get :show, :id => @user.to_param
    assert_response :success
  end

  test "should get edit" do
    UserSession.create(users(:one))
    get :edit, :id => @user.to_param
    assert_response :success
  end

  test "should update user" do
    UserSession.create(users(:one))
    put :update, :id => @user.to_param, :user => @user.attributes
    assert_redirected_to account_path
  end
end
