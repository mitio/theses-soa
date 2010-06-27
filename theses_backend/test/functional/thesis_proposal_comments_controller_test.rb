require 'test_helper'

class ThesisProposalCommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thesis_proposal_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thesis_proposal_comment" do
    assert_difference('ThesisProposalComment.count') do
      post :create, :thesis_proposal_comment => { }
    end

    assert_redirected_to thesis_proposal_comment_path(assigns(:thesis_proposal_comment))
  end

  test "should show thesis_proposal_comment" do
    get :show, :id => thesis_proposal_comments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thesis_proposal_comments(:one).to_param
    assert_response :success
  end

  test "should update thesis_proposal_comment" do
    put :update, :id => thesis_proposal_comments(:one).to_param, :thesis_proposal_comment => { }
    assert_redirected_to thesis_proposal_comment_path(assigns(:thesis_proposal_comment))
  end

  test "should destroy thesis_proposal_comment" do
    assert_difference('ThesisProposalComment.count', -1) do
      delete :destroy, :id => thesis_proposal_comments(:one).to_param
    end

    assert_redirected_to thesis_proposal_comments_path
  end
end
