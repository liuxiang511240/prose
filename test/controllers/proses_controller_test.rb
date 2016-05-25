require 'test_helper'

class ProsesControllerTest < ActionController::TestCase
  setup do
    @prose = proses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prose" do
    assert_difference('Prose.count') do
      post :create, prose: {  }
    end

    assert_redirected_to prose_path(assigns(:prose))
  end

  test "should show prose" do
    get :show, id: @prose
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prose
    assert_response :success
  end

  test "should update prose" do
    patch :update, id: @prose, prose: {  }
    assert_redirected_to prose_path(assigns(:prose))
  end

  test "should destroy prose" do
    assert_difference('Prose.count', -1) do
      delete :destroy, id: @prose
    end

    assert_redirected_to proses_path
  end
end
