class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @contact = Contact.find_by(user_id: current_user.id)
    @students = Student.includes(:user).where(user_id: current_user.id)
    redirect_to root_path unless @user == current_user
  end
end
