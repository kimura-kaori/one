module StudentsHelper
  def selection_new_or_edit
    if action_name == 'new' || action_name == 'create'
      user_students_path
    elsif action_name == 'edit'|| action_name == 'update'|| action_name == 'show'
      user_student_path(@user, @student)
    end
  end
end
