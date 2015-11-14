require 'test_helper'

class ProplikesControllerTest < ActionController::TestCase
  setup do
    @proplike = proplikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proplikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proplike" do
    assert_difference('Proplike.count') do
      post :create, proplike: { proposal_id: @proplike.proposal_id, score: @proplike.score, user_id: @proplike.user_id }
    end

    assert_redirected_to proplike_path(assigns(:proplike))
  end

  test "should show proplike" do
    get :show, id: @proplike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proplike
    assert_response :success
  end

  test "should update proplike" do
    patch :update, id: @proplike, proplike: { proposal_id: @proplike.proposal_id, score: @proplike.score, user_id: @proplike.user_id }
    assert_redirected_to proplike_path(assigns(:proplike))
  end

  test "should destroy proplike" do
    assert_difference('Proplike.count', -1) do
      delete :destroy, id: @proplike
    end

    assert_redirected_to proplikes_path
  end
end
