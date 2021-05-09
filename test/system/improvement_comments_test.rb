require "application_system_test_case"

class ImprovementCommentsTest < ApplicationSystemTestCase
  setup do
    @improvement_comment = improvement_comments(:one)
  end

  test "visiting the index" do
    visit improvement_comments_url
    assert_selector "h1", text: "Improvement Comments"
  end

  test "creating a Improvement comment" do
    visit improvement_comments_url
    click_on "New Improvement Comment"

    fill_in "Body", with: @improvement_comment.body
    fill_in "Improvement", with: @improvement_comment.improvement_id
    fill_in "Title", with: @improvement_comment.title
    fill_in "User", with: @improvement_comment.user_id
    click_on "Create Improvement comment"

    assert_text "Improvement comment was successfully created"
    click_on "Back"
  end

  test "updating a Improvement comment" do
    visit improvement_comments_url
    click_on "Edit", match: :first

    fill_in "Body", with: @improvement_comment.body
    fill_in "Improvement", with: @improvement_comment.improvement_id
    fill_in "Title", with: @improvement_comment.title
    fill_in "User", with: @improvement_comment.user_id
    click_on "Update Improvement comment"

    assert_text "Improvement comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Improvement comment" do
    visit improvement_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Improvement comment was successfully destroyed"
  end
end
