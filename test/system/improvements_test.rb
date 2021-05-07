require "application_system_test_case"

class ImprovementsTest < ApplicationSystemTestCase
  setup do
    @improvement = improvements(:one)
  end

  test "visiting the index" do
    visit improvements_url
    assert_selector "h1", text: "Improvements"
  end

  test "creating a Improvement" do
    visit improvements_url
    click_on "New Improvement"

    fill_in "Actual effort", with: @improvement.actual_effort
    fill_in "Description", with: @improvement.description
    fill_in "Estimated effort", with: @improvement.estimated_effort
    check "Is private" if @improvement.is_private
    fill_in "Name", with: @improvement.name
    fill_in "Status", with: @improvement.status
    click_on "Create Improvement"

    assert_text "Improvement was successfully created"
    click_on "Back"
  end

  test "updating a Improvement" do
    visit improvements_url
    click_on "Edit", match: :first

    fill_in "Actual effort", with: @improvement.actual_effort
    fill_in "Description", with: @improvement.description
    fill_in "Estimated effort", with: @improvement.estimated_effort
    check "Is private" if @improvement.is_private
    fill_in "Name", with: @improvement.name
    fill_in "Status", with: @improvement.status
    click_on "Update Improvement"

    assert_text "Improvement was successfully updated"
    click_on "Back"
  end

  test "destroying a Improvement" do
    visit improvements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Improvement was successfully destroyed"
  end
end
