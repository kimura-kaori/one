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
        redirect_to user_student_path(@student.id, user_id: @user.id), notice: "基本情報を登録しました。"
      else
        render :new
      end
  end

  def update
    @user = User.find(params[:user_id])
    @student = Student.find(params[:id])
      if @student.update(student_params)
        redirect_to user_student_path(@user, @student), notice: "基本情報を更新しました。"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
      redirect_to students_url, notice: "基本情報を削除しました。"
  end

  def mypage
    @contact = Contact.find_by(user_id: current_user.id)
    @students = Student.includes(:user).where(user_id: current_user.id)
  end

  def report
    @user = User.find(params[:user_id])
    @student = Student.find(params[:id])
    Contact.find_or_create_by!(title: 'ルーム作成', user_id: current_user.id)#ここで作成したコンタクトルームを呼べない、nillになる
    # contact_room_url = request.headers[:referer]#これだとマイページにとぶ
    # contact_room_url = user_contact_path(@contact.id, user_id: current_user.id)
    contact_room_url = "#{request.base_url}/users/#{current_user.id}/contacts/#{Contact.find_by(user_id: current_user.id).id}"
    ReportMailer.send_message_to_school(contact_room_url, @current_user, @student).deliver
    ReportMailer.welcome_email(contact_room_url, @current_user, @student).deliver
    redirect_to user_path(current_user), notice: "お手続きありがとうございました。通知が完了しました。"
  end

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
