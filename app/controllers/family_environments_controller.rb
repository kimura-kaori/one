class FamilyEnvironmentsController < ApplicationController
  before_action :set_family_environment, only: %i[  edit update destroy ]

  def index
    @student = Student.find(params[:id])


    # @student_family_environment_students = StudentFamilyEnvironment.find_by(student_id: @student.id)
    # @family_environment = FamilyEnvironment.find(params[:student_id])
    @my_family_environments = @student.family_environments

    # @family_environments = FamilyEnvironment.includes(:student).where(student_id: student.id)
  end

  def show
    @family_environment = FamilyEnvironment.find(params[:id])
    #     binding.irb
    # @my_family_environmens = StudentFamilyEnvironment.find_by(student_id: @student.id)
    # @family_environment = FamilyEnvironment.find(params[:student_id])
    # @my_family_environments = @student.my_family_environments
    # @family_environment =@student.family_environment

  end

  def new
    @family_environment = FamilyEnvironment.new
  end

  def edit
  end

  def create
    @student = Student.find(params[:id])
    @family_environment = @student.family_environments.build(family_environment_params)

    # @family_environment = student.family_environments.build(family_environment_params)

    if @family_environment.save!
      redirect_to family_environment_url(@student, @family_environment), notice: "Family environment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @family_environment.update(family_environment_params)
        format.html { redirect_to family_environment_url(@family_environment), notice: "Family environment was successfully updated." }
        format.json { render :show, status: :ok, location: @family_environment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family_environment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @family_environment.destroy

    respond_to do |format|
      format.html { redirect_to family_environments_url, notice: "Family environment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_family_environment
      @family_environment = FamilyEnvironment.find(params[:id])
    end

    def family_environment_params
      params.require(:family_environment).permit(:relationship, :name, :birthday, :age, :family, :student_id)
    end

end
