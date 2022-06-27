class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @contact = Contact.find_by(user_id: current_user.id)
    @students = Student.includes(:user).where(user_id: current_user.id)
  end
end
