require 'test_helper'

class ImprovementCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @improvement_comment = improvement_comments(:one)
  end

  test "should get index" do
    get improvement_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_improvement_comment_url
    assert_response :success
  end

  test "should create improvement_comment" do
    assert_difference('ImprovementComment.count') do
      post improvement_comments_url, params: { improvement_comment: { body: @improvement_comment.body, improvement_id: @improvement_comment.improvement_id, title: @improvement_comment.title, user_id: @improvement_comment.user_id } }
    end

    assert_redirected_to improvement_comment_url(ImprovementComment.last)
  end

  test "should show improvement_comment" do
    get improvement_comment_url(@improvement_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_improvement_comment_url(@improvement_comment)
    assert_response :success
  end

  test "should update improvement_comment" do
    patch improvement_comment_url(@improvement_comment), params: { improvement_comment: { body: @improvement_comment.body, improvement_id: @improvement_comment.improvement_id, title: @improvement_comment.title, user_id: @improvement_comment.user_id } }
    assert_redirected_to improvement_comment_url(@improvement_comment)
  end

  test "should destroy improvement_comment" do
    assert_difference('ImprovementComment.count', -1) do
      delete improvement_comment_url(@improvement_comment)
    end

    assert_redirected_to improvement_comments_url
  end
end
