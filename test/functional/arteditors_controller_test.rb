require 'test_helper'

class ArteditorsControllerTest < ActionController::TestCase
  setup do
    @arteditor = arteditors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arteditors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arteditor" do
    assert_difference('Arteditor.count') do
      post :create, arteditor: @arteditor.attributes
    end

    assert_redirected_to arteditor_path(assigns(:arteditor))
  end

  test "should show arteditor" do
    get :show, id: @arteditor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arteditor.to_param
    assert_response :success
  end

  test "should update arteditor" do
    put :update, id: @arteditor.to_param, arteditor: @arteditor.attributes
    assert_redirected_to arteditor_path(assigns(:arteditor))
  end

  test "should destroy arteditor" do
    assert_difference('Arteditor.count', -1) do
      delete :destroy, id: @arteditor.to_param
    end

    assert_redirected_to arteditors_path
  end
end
