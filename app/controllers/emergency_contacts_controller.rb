class EmergencyContactsController < ApplicationController
  before_action :set_emergency_contact, only: %i[  edit update destroy ]

  def index
    @student = Student.find(params[:student_id])
    @my_emergency_contacts = @student.emergency_contacts
  end

  def show
    @emergency_contact = EmergencyContact.find(params[:id])
  end

  def new
    @emergency_contact = EmergencyContact.new
  end

  def create
    @student = Student.find(params[:student_id])
    @emergency_contact = @student.emergency_contacts.build(emergency_contact_params)
      if @emergency_contact.save!
        redirect_to student_emergency_contact_url(@student, @emergency_contact), notice: "Emergency contact was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    # binding.irb
    @student = Student.find(params[:student_id])
  end

  def update
      @student = Student.find(params[:student_id])
      if @emergency_contact.update(emergency_contact_params)
        redirect_to student_emergency_contact_path(@student, @emergency_contact), notice: "Emergency contact was successfully updated."
      else
        render :edit
      end
  end

  def destroy
    @emergency_contact.destroy
      redirect_to student_emergency_contact_path, notice: "Emergency contact was successfully destroyed."
    end


  private

    def set_emergency_contact
      @emergency_contact = EmergencyContact.find(params[:id])
    end

    def emergency_contact_params
      params.require(:emergency_contact).permit(:name, :relationship, :contact_address, :telephone, :student_id)
    end

end
