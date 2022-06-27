class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def user_confirmation
    @student = Student.find(params[:id])
    @user = @student.user
    redirect_to root_path unless @user == current_user || current_user.admin == true
  end
end
