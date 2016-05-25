require 'test_helper'

class PoetriesControllerTest < ActionController::TestCase
  setup do
    @poetry = poetries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poetries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poetry" do
    assert_difference('Poetry.count') do
      post :create, poetry: {  }
    end

    assert_redirected_to poetry_path(assigns(:poetry))
  end

  test "should show poetry" do
    get :show, id: @poetry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poetry
    assert_response :success
  end

  test "should update poetry" do
    patch :update, id: @poetry, poetry: {  }
    assert_redirected_to poetry_path(assigns(:poetry))
  end

  test "should destroy poetry" do
    assert_difference('Poetry.count', -1) do
      delete :destroy, id: @poetry
    end

    assert_redirected_to poetries_path
  end
end
