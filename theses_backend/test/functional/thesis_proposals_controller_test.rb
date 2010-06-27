require 'test_helper'

class ThesisProposalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thesis_proposals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thesis_proposal" do
    assert_difference('ThesisProposal.count') do
      post :create, :thesis_proposal => { }
    end

    assert_redirected_to thesis_proposal_path(assigns(:thesis_proposal))
  end

  test "should show thesis_proposal" do
    get :show, :id => thesis_proposals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thesis_proposals(:one).to_param
    assert_response :success
  end

  test "should update thesis_proposal" do
    put :update, :id => thesis_proposals(:one).to_param, :thesis_proposal => { }
    assert_redirected_to thesis_proposal_path(assigns(:thesis_proposal))
  end

  test "should destroy thesis_proposal" do
    assert_difference('ThesisProposal.count', -1) do
      delete :destroy, :id => thesis_proposals(:one).to_param
    end

    assert_redirected_to thesis_proposals_path
  end
end
