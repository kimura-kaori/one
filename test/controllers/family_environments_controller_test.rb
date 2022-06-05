require 'test_helper'

class FamilyEnvironmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family_environment = family_environments(:one)
  end

  test "should get index" do
    get family_environments_url
    assert_response :success
  end

  test "should get new" do
    get new_family_environment_url
    assert_response :success
  end

  test "should create family_environment" do
    assert_difference('FamilyEnvironment.count') do
      post family_environments_url, params: { family_environment: { age: @family_environment.age, birthday: @family_environment.birthday, family: @family_environment.family, name: @family_environment.name, relationship: @family_environment.relationship, student_id: @family_environment.student_id } }
    end

    assert_redirected_to family_environment_url(FamilyEnvironment.last)
  end

  test "should show family_environment" do
    get family_environment_url(@family_environment)
    assert_response :success
  end

  test "should get edit" do
    get edit_family_environment_url(@family_environment)
    assert_response :success
  end

  test "should update family_environment" do
    patch family_environment_url(@family_environment), params: { family_environment: { age: @family_environment.age, birthday: @family_environment.birthday, family: @family_environment.family, name: @family_environment.name, relationship: @family_environment.relationship, student_id: @family_environment.student_id } }
    assert_redirected_to family_environment_url(@family_environment)
  end

  test "should destroy family_environment" do
    assert_difference('FamilyEnvironment.count', -1) do
      delete family_environment_url(@family_environment)
    end

    assert_redirected_to family_environments_url
  end
end
