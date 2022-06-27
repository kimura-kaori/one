class EmergencyContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @my_emergency_contacts = @student.emergency_contacts
    redirect_to root_path unless @user == current_user
  end

  def show
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @emergency_contact = EmergencyContact.find(params[:id])
    redirect_to root_path unless @user == current_user
  end

  def new
    @student = Student.find(params[:student_id])
    @emergency_contact = EmergencyContact.new
  end

  def create
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @emergency_contact = @student.emergency_contacts.build(emergency_contact_params)
      if @emergency_contact.save
        redirect_to user_student_emergency_contact_path(@user, @student, @emergency_contact), notice: "緊急連絡先を登録しました。"
      else
        render :new
      end
  end

  def edit
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @emergency_contact = EmergencyContact.find(params[:id])
    redirect_to root_path unless @user == current_user
  end

  def update
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @emergency_contact = EmergencyContact.find(params[:id])
      if @emergency_contact.update(emergency_contact_params)
        redirect_to user_student_emergency_contact_path(@user, @student, @emergency_contact), notice: "緊急連絡先情報を更新しました。"
      else
        render :edit
      end
  end

  def destroy
    @emergency_contact = EmergencyContact.find(params[:id])
    @emergency_contact.destroy
      redirect_to user_student_emergency_contact_path, notice: "緊急連絡先情報を削除しました。"
    end

  private

    def emergency_contact_params
      params.require(:emergency_contact).permit(:name, :relationship, :contact_address, :telephone, :student_id, :user_id)
    end

end
