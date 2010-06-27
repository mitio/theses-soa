require 'test_helper'

class ThesisReviewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thesis_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thesis_review" do
    assert_difference('ThesisReview.count') do
      post :create, :thesis_review => { }
    end

    assert_redirected_to thesis_review_path(assigns(:thesis_review))
  end

  test "should show thesis_review" do
    get :show, :id => thesis_reviews(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thesis_reviews(:one).to_param
    assert_response :success
  end

  test "should update thesis_review" do
    put :update, :id => thesis_reviews(:one).to_param, :thesis_review => { }
    assert_redirected_to thesis_review_path(assigns(:thesis_review))
  end

  test "should destroy thesis_review" do
    assert_difference('ThesisReview.count', -1) do
      delete :destroy, :id => thesis_reviews(:one).to_param
    end

    assert_redirected_to thesis_reviews_path
  end
end
