class EmergencyContactsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @my_emergency_contacts = @student.emergency_contacts
  end

  def show
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @emergency_contact = EmergencyContact.find(params[:id])
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
        redirect_to user_student_emergency_contact_path(@user, @student, @emergency_contact), notice: "Emergency contact was successfully created."
      else
        render :new
      end
  end

  def edit
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @emergency_contact = EmergencyContact.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @emergency_contact = EmergencyContact.find(params[:id])
      if @emergency_contact.update(emergency_contact_params)
        redirect_to user_student_emergency_contact_path(@user, @student, @emergency_contact), notice: "Emergency contact was successfully updated."
      else
        render :edit
      end
  end

  def destroy
    @emergency_contact = EmergencyContact.find(params[:id])
    @emergency_contact.destroy
      redirect_to user_student_emergency_contact_path, notice: "Emergency contact was successfully destroyed."
    end

  private

    def emergency_contact_params
      params.require(:emergency_contact).permit(:name, :relationship, :contact_address, :telephone, :student_id, :user_id)
    end

end
