require 'test_helper'

class ApprovesControllerTest < ActionController::TestCase
  setup do
    @approfe = approves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:approves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create approfe" do
    assert_difference('Approve.count') do
      post :create, approfe: { proposal_id: @approfe.proposal_id, score: @approfe.score, user: @approfe.user }
    end

    assert_redirected_to approfe_path(assigns(:approfe))
  end

  test "should show approfe" do
    get :show, id: @approfe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @approfe
    assert_response :success
  end

  test "should update approfe" do
    patch :update, id: @approfe, approfe: { proposal_id: @approfe.proposal_id, score: @approfe.score, user: @approfe.user }
    assert_redirected_to approfe_path(assigns(:approfe))
  end

  test "should destroy approfe" do
    assert_difference('Approve.count', -1) do
      delete :destroy, id: @approfe
    end

    assert_redirected_to approves_path
  end
end
