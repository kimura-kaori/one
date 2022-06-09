module FamilyEnvironmentsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      student_family_environments_path
    elsif action_name == 'edit'|| action_name == 'update'|| action_name == 'show'
      student_family_environment_path(@student,@family_environment)
    end
  end
end
