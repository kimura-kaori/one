class EmergencyContactsController < ApplicationController
  before_action :set_emergency_contact, only: %i[ show edit update destroy ]

  def index
    @emergency_contacts =EmergencyContact.includes(:student).where(student_id: student.id)
    # if params[:student_id]
    #   # Studentのデータベースのテーブルから一致するidを取得
    #   @student = Student.find(params[:student_id])
    #
    #   # student_idと紐づく緊急連絡先を取得
    #   @emergency_contacts = @student.emergency_contacts.order(created_at: :desc).all
    # # else
    #   # 緊急連絡先すべてを取得
    # #   @emergency_contacts = Emergency_contact.order(created_at: :desc).all
    # end

  end

  def show
  end

  def new
    @emergency_contact = EmergencyContact.new

    # 2.times do
    #   @emergency_contact.students.build
    # end
  end

  def edit
  end

  def create
    @emergency_contact = student.emergency_contacts.build(emergency_contact_params)

    respond_to do |format|
      if @emergency_contact.save
        format.html { redirect_to emergency_contact_url(@emergency_contact), notice: "Emergency contact was successfully created." }
        format.json { render :show, status: :created, location: @emergency_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @emergency_contact.update(emergency_contact_params)
        format.html { redirect_to emergency_contact_url(@emergency_contact), notice: "Emergency contact was successfully updated." }
        format.json { render :show, status: :ok, location: @emergency_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @emergency_contact.destroy

    respond_to do |format|
      format.html { redirect_to emergency_contacts_url, notice: "Emergency contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_emergency_contact
      @emergency_contact = EmergencyContact.find(params[:id])
    end

    def emergency_contact_params
      params.require(:emergency_contact).permit(:name, :relationship, :contact_address, :telephone, :student_id)
    end

    def user_confirmation
      @student = Student.find(params[:id])
      @user = @student.user
      redirect_to root_path unless @user == current_user
    end

end
