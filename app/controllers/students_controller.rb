class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_confirmation, only: %i[ show edit update destroy ]

  def index
    #ログインしているユーザーに紐づく生徒情報だけ表示.
    @user = User.find(paramu[:user_id])
    @students = Student.includes(:user).where(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @student = current_user.students.build(student_params)

      if @student.save
        redirect_to user_student_path(@student.id, user_id: @user.id), notice: "Student was successfully created."
      else
        render :new
      end
  end

  def update
    @user = User.find(params[:user_id])
    @student = Student.find(params[:id])
      if @student.update(student_params)
        redirect_to user_student_path(@student, user_id: @user.id), notice: "Student was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
      redirect_to students_url, notice: "Student was successfully destroyed."
  end

  def mypage
    @contact = Contact.find_by(user_id: current_user.id)
    @students = Student.includes(:user).where(user_id: current_user.id)
  end

  # def contact
  #   @contact = Contact.find(params[:id])
  #   @comments = @contact.comments
  #   @comment = @contact.comments.build
  #   end
  # end

  def report
    @user = User.find(params[:user_id])
    @student = Student.find(params[:id])
    #コンタクトルームを作成する。
    #引数の一つとしてURLを送る。(http://localhost:3000/users/3/contacts/23)
    ReportMailer.send_message_to_school(@student).deliver
    #redirect_to マイページにもどす

  end

  # def keijiban_mail
  #   @student = Student.find(params[:id])
  #   ReportMailer.send_message_to_kejiban(@student).deliver
  # end

  private

    def student_params
      params.require(:student).permit(:student_furigana, :student_name, :sex, :birthday, :telephone, :cellphone, :post_code, :address, :parents_furigana, :parents_name, :relationship, :user_id)
    end

    def user_confirmation
      @student = Student.find(params[:id])
      @user = @student.user
      redirect_to root_path unless @user == current_user || current_user.admin == true
    end
end
