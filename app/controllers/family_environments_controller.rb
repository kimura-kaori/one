class FamilyEnvironmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @my_family_environments = @student.family_environments
    redirect_to root_path unless @user == current_user || current_user.admin == true
  end

  def show
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @family_environment = FamilyEnvironment.find(params[:id])
    redirect_to root_path unless @user == current_user || current_user.admin == true
  end

  def new
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @family_environment = FamilyEnvironment.new
  end

  def create
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @family_environment = @student.family_environments.build(family_environment_params)
    if @family_environment.save
      redirect_to user_student_family_environment_path(@family_environment.id, student_id: @student.id, user_id: @user.id), notice: "家庭環境調査を登録しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @student = Student.find(params[:student_id])
    @family_environment = FamilyEnvironment.find(params[:id])
    redirect_to root_path unless @user == current_user || current_user.admin == true
  end

  def update
    @user = User.find(params[:user_id])
    @family_environment = FamilyEnvironment.find(params[:id])
    @student = Student.find(params[:student_id])
      if @family_environment.update(family_environment_params)
        redirect_to user_student_family_environment_path(@user, @student, @family_environment), notice: "家庭環境調査を更新しました。"
      else
        render :edit
      end
  end

  def destroy
    @family_environment = FamilyEnvironment.find(params[:id])
    @family_environment.destroy
    redirect_to family_environments_url, notice: "家庭環境調査を削除しました。"
  end

  private

    def family_environment_params
      params.require(:family_environment).permit(:relationship, :name, :birthday, :age, :family, :student_id, :user_id)
    end
end
