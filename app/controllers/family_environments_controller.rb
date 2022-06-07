class FamilyEnvironmentsController < ApplicationController
  before_action :set_family_environment, only: %i[ show edit update destroy ]

  def index
    @family_environments = FamilyEnvironment.all
    # @family_environments = FamilyEnvironment.includes(:student).where(student_id: student.id)
  end

  def show
  end

  def new
    @family_environment = FamilyEnvironment.new
  end

  def edit
  end

  def create
    @family_environment = student.family_environments.build(family_environment_params)

    respond_to do |format|
      if @family_environment.save
        format.html { redirect_to family_environment_url(@family_environment), notice: "Family environment was successfully created." }
        format.json { render :show, status: :created, location: @family_environment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family_environment.errors, status: :unprocessable_entity }
      end
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
