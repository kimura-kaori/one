require "application_system_test_case"

class EmergencyContactsTest < ApplicationSystemTestCase
  setup do
    @emergency_contact = emergency_contacts(:one)
  end

  test "visiting the index" do
    visit emergency_contacts_url
    assert_selector "h1", text: "Emergency Contacts"
  end

  test "creating a Emergency contact" do
    visit emergency_contacts_url
    click_on "New Emergency Contact"

    fill_in "Contact address", with: @emergency_contact.contact_address
    fill_in "Name", with: @emergency_contact.name
    fill_in "Relationship", with: @emergency_contact.relationship
    fill_in "Student", with: @emergency_contact.student_id
    fill_in "Telephone", with: @emergency_contact.telephone
    click_on "Create Emergency contact"

    assert_text "Emergency contact was successfully created"
    click_on "Back"
  end

  test "updating a Emergency contact" do
    visit emergency_contacts_url
    click_on "Edit", match: :first

    fill_in "Contact address", with: @emergency_contact.contact_address
    fill_in "Name", with: @emergency_contact.name
    fill_in "Relationship", with: @emergency_contact.relationship
    fill_in "Student", with: @emergency_contact.student_id
    fill_in "Telephone", with: @emergency_contact.telephone
    click_on "Update Emergency contact"

    assert_text "Emergency contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Emergency contact" do
    visit emergency_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Emergency contact was successfully destroyed"
  end
end
