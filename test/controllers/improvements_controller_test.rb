require 'test_helper'

class ImprovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @improvement = improvements(:one)
  end

  test "should get index" do
    get improvements_url
    assert_response :success
  end

  test "should get new" do
    get new_improvement_url
    assert_response :success
  end

  test "should create improvement" do
    assert_difference('Improvement.count') do
      post improvements_url, params: { improvement: { actual_effort: @improvement.actual_effort, description: @improvement.description, estimated_effort: @improvement.estimated_effort, is_private: @improvement.is_private, name: @improvement.name, status: @improvement.status } }
    end

    assert_redirected_to improvement_url(Improvement.last)
  end

  test "should show improvement" do
    get improvement_url(@improvement)
    assert_response :success
  end

  test "should get edit" do
    get edit_improvement_url(@improvement)
    assert_response :success
  end

  test "should update improvement" do
    patch improvement_url(@improvement), params: { improvement: { actual_effort: @improvement.actual_effort, description: @improvement.description, estimated_effort: @improvement.estimated_effort, is_private: @improvement.is_private, name: @improvement.name, status: @improvement.status } }
    assert_redirected_to improvement_url(@improvement)
  end

  test "should destroy improvement" do
    assert_difference('Improvement.count', -1) do
      delete improvement_url(@improvement)
    end

    assert_redirected_to improvements_url
  end
end
