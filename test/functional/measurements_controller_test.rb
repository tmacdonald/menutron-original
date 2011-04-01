require 'test_helper'

class MeasurementsControllerTest < ActionController::TestCase
  setup do
    @measurement = measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measurements)
  end

  test "should get index using json" do
    get :index, :format => "json"
    assert_response :success
    assert_not_nil assigns(:measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measurement" do
    assert_difference('Measurement.count') do
      post :create, :measurement => @measurement.attributes
    end

    assert_redirected_to measurement_path(assigns(:measurement))
  end

  test "should create measurement using json" do
    assert_difference('Measurement.count') do
      post :create, :measurement => @measurement.attributes, :format => "json"
    end

    assert_response :success
  end

  test "should show measurement" do
    get :show, :id => @measurement.to_param
    assert_response :success
  end

  test "should show measurement using json" do
    get :show, :id => @measurement.to_param, :format => "json"
    assert_response :success
    assert_not_nil assigns(:measurement)
  end

  test "should get edit" do
    get :edit, :id => @measurement.to_param
    assert_response :success
  end

  test "should update measurement" do
    put :update, :id => @measurement.to_param, :measurement => @measurement.attributes
    assert_redirected_to measurement_path(assigns(:measurement))
  end

  test "should update measurement using json" do
    put :update, :id => @measurement.to_param, :measurement => @measurement.attributes, :format => "json"
    assert_response :success
  end

  test "should destroy measurement" do
    assert_difference('Measurement.count', -1) do
      delete :destroy, :id => @measurement.to_param
    end

    assert_redirected_to measurements_path
  end

  test "should destroy measurement using json" do
    assert_difference('Measurement.count', -1) do
      delete :destroy, :id => @measurement.to_param, :format => "json"
    end

    assert_response :success
  end
end
