module EmergencyContactsHelper
  def choice_new_or_edit
    if action_name == 'new' || action_name == 'create'
      student_emergency_contacts_path
    elsif action_name == 'edit'|| action_name == 'update' || action_name == 'show'
      student_emergency_contact_path(@student,@emergency_contact)
    end
  end
end
