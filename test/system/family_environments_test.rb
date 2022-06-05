require "application_system_test_case"

class FamilyEnvironmentsTest < ApplicationSystemTestCase
  setup do
    @family_environment = family_environments(:one)
  end

  test "visiting the index" do
    visit family_environments_url
    assert_selector "h1", text: "Family Environments"
  end

  test "creating a Family environment" do
    visit family_environments_url
    click_on "New Family Environment"

    fill_in "Age", with: @family_environment.age
    fill_in "Birthday", with: @family_environment.birthday
    fill_in "Family", with: @family_environment.family
    fill_in "Name", with: @family_environment.name
    fill_in "Relationship", with: @family_environment.relationship
    fill_in "Student", with: @family_environment.student_id
    click_on "Create Family environment"

    assert_text "Family environment was successfully created"
    click_on "Back"
  end

  test "updating a Family environment" do
    visit family_environments_url
    click_on "Edit", match: :first

    fill_in "Age", with: @family_environment.age
    fill_in "Birthday", with: @family_environment.birthday
    fill_in "Family", with: @family_environment.family
    fill_in "Name", with: @family_environment.name
    fill_in "Relationship", with: @family_environment.relationship
    fill_in "Student", with: @family_environment.student_id
    click_on "Update Family environment"

    assert_text "Family environment was successfully updated"
    click_on "Back"
  end

  test "destroying a Family environment" do
    visit family_environments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Family environment was successfully destroyed"
  end
end
