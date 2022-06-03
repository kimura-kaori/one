require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Adress", with: @student.adress
    fill_in "Birthday", with: @student.birthday
    fill_in "Cellphone", with: @student.cellphone
    fill_in "Parents furigana", with: @student.parents_furigana
    fill_in "Parents name", with: @student.parents_name
    fill_in "Relationship", with: @student.relationship
    fill_in "Sex", with: @student.sex
    fill_in "Student furigana", with: @student.student_furigana
    fill_in "Student name", with: @student.student_name
    fill_in "Telephone", with: @student.telephone
    fill_in "Update date", with: @student.update_date
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @student.adress
    fill_in "Birthday", with: @student.birthday
    fill_in "Cellphone", with: @student.cellphone
    fill_in "Parents furigana", with: @student.parents_furigana
    fill_in "Parents name", with: @student.parents_name
    fill_in "Relationship", with: @student.relationship
    fill_in "Sex", with: @student.sex
    fill_in "Student furigana", with: @student.student_furigana
    fill_in "Student name", with: @student.student_name
    fill_in "Telephone", with: @student.telephone
    fill_in "Update date", with: @student.update_date
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
